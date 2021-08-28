# a = Agent(3, 2)


def prueba(x, y, z):
    return x + 1


import warnings

import sys

if not hasattr(sys, 'argv'):
    sys.argv  = ['']


warnings.simplefilter(action="ignore", category=FutureWarning)
import tensorflow as tf
import numpy as np
import pandas as pd
from tensorflow import keras

from collections import deque
import time
import random


import os.path


RANDOM_SEED = 5
tf.compat.v1.random.set_random_seed(RANDOM_SEED)
AGENT_NAME = "dqn-agent.h5"


class Agent:
    def __init__(self, state_shape, action_shape, fileName):
        self.learning_rate = 0.001
        self.state = state_shape
        self.action = action_shape
        self.replay_memory = deque(maxlen=10_000)
        self.file = open(f'resultados/{fileName.replace("/", "_")}.csv', "w")
        self.iter = 0
        if os.path.exists(AGENT_NAME):
            print("Se carga de archivo")
            # self.model = tf.saved_model.load(f'/home/alen/ibex-lib/examples/{AGENT_NAME}')
            self.model = keras.models.load_model(
                f"/home/alen/ibex-lib/examples/{AGENT_NAME}/"
            )
        else:
            # Se inicializa la red principal y objetivo
            # Red principal se actualiza cada 4 ejemplos
            self.model = self.agent(state_shape, action_shape)

        # El modelo objetivo, inicializado con los pesos del principal
        self.target_model = self.agent(state_shape, action_shape)
        self.target_model.set_weights(self.model.get_weights())

        # Se guardan los datos para el entrenamiento
        self.last_action = -1
        self.epsilon = 1
        self.min_epsilon = 0.01
        self.decay = 0.01

    def agent(self, state_shape, action_shape):

        model = keras.Sequential()
        model.add(keras.layers.Dense(3, input_shape=(int(state_shape),), activation="relu"))
        # model.add(keras.layers.Dense(2, activation='relu'))
        model.add(keras.layers.Dense(int(action_shape), activation="linear"))
        model.compile(loss=tf.keras.losses.Huber(), optimizer="sgd")
        # model.compile(loss=tf.keras.losses.Huber(), optimizer=tf.keras.optimizers.Adam(lr=self.learning_rate), metrics=['accuracy'])
        return model

    def get_qs(self, state, update, main_model):
        state = np.array(state)
        # re ordena para que le haga sentido al modelo
        state = state.reshape([1, state.shape[0]])

        modelo = self.model if main_model else self.target_model

        # predice y queda en arreglos de arreglos, por lo que se saca el primero
        main_model_pred = modelo.predict(state)[0]

        # Se retorna como lista para poder transformarlo a vector de c++
        return main_model_pred.tolist()

    def select_qs(self, qs, upd, reduce=True):
        # Ejecutar epsilon-greedy
        seleccionado = -1
        if reduce and self.epsilon - self.decay >= self.min_epsilon:
            self.epsilon -= self.decay

        ra = random.uniform(0, 1)
        if ra > self.epsilon:
            # print("max")
            seleccionado = qs.index(max(qs))
        else:
            # print("random")
            seleccionado = random.randint(0, self.action - 1)

        self.last_action = seleccionado
        # print(seleccionado)
        self.file.write(f"{self.iter};{seleccionado}\n")
        self.iter += 1
        # print(f"{self.iter};{seleccionado}\n")
        return seleccionado

    def select_max_qs(self, qs):
        return qs.index(max(qs))

    def upd_last_action(self, action):
        self.last_action = action

    """
        Guarda la experiencia dentro de la replay memory
        
        observation: el estado
        action: el id de la acción tomada
        reward: el resultado de la función de recompensa
        new_observation: el estado resultante de ejecutar la acción
        done: si es que terminó la simulación. En nuestro caso cuando new_observation sea null


    """

    def recolecta_experiencia(self, observation, reward, new_observation, done):
        terminado = True if done == 1 else False

        # print(f'observation: {observation}\n')
        # print(f'reward: {reward}\n')
        # print(f'new_obs: {new_observation}\n')
        # print(f'done: {done}\n')

        self.replay_memory.append(
            [observation, self.last_action, reward, new_observation, terminado]
        )
        return 1

    def train(self):

        learning_rate = 0.7
        discount_factor = 0.618

        MIN_REPLAY_SIZE = 10
        if len(self.replay_memory) < MIN_REPLAY_SIZE:
            return

        batch_size = MIN_REPLAY_SIZE
        minibatch = random.sample(self.replay_memory, batch_size)

        current_states = np.array([transition[0] for transition in minibatch])
        current_qs_list = self.model.predict(current_states)

        new_current_states = np.array([transition[3] for transition in minibatch])
        future_qs_list = self.target_model.predict(new_current_states)

        X = []
        Y = []

        for index, (observation, action, reward, new_observation, done) in enumerate(
            minibatch
        ):
            if not done:
                max_future_q = reward + discount_factor * np.max(future_qs_list[index])
            else:
                max_future_q = reward

            current_qs = current_qs_list[index]
            current_qs[action] = (1 - learning_rate) * current_qs[
                action
            ] + learning_rate * max_future_q

            X.append(observation)
            Y.append(current_qs)

        self.model.fit(
            np.array(X), np.array(Y), batch_size=batch_size, verbose=0, shuffle=True
        )
        return 1

    def transfer_weights(self):
        self.target_model.set_weights(self.model.get_weights())
        return 1

    def save_agent(self):
        # tf.keras.models.save_model(self.target_model, f'./{AGENT_NAME}')
        tf.saved_model.save(self.target_model, AGENT_NAME)
        # self.target_model.save(AGENT_NAME)
