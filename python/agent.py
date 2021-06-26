#a = Agent(3, 2)

def prueba(x, y, z):
    return x +1
    


import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)
import tensorflow as tf
import numpy as np
from tensorflow import keras

from collections import deque
import time
import random



import os.path


RANDOM_SEED = 5
tf.random.set_seed(RANDOM_SEED)


class Agent:
    def __init__(self, state_shape, action_shape):
        self.learning_rate = 0.001
        self.state = state_shape
        self.action = action_shape
        self.model = self.agent(state_shape, action_shape)
        self.replay_memory = deque(maxlen=10_000)
        self.target_model = self.agent(state_shape, action_shape) 
        self.target_model.set_weights(self.model.get_weights())

    def pruebaInnit(self, x, y):
        print(f'states = {self.state}')
        print(f'actions = {self.action}')
        print(x)
        print(y)
        #return x + y
    
    def agent(self, state_shape, action_shape):
        

        model = keras.Sequential()

        # La entrada = cantidad de datos del estado
        model.add(keras.layers.Input(shape=(state_shape,)))

        # La arquitectura de capas ocultas (n_nodos ocultos, función de activación)
        arquitectura = [(24, 'relu'), (12, 'linear')]
        for hn, act in arquitectura:
            model.add(keras.layers.Dense(hn, activation=act))

        # La salida = cantidad de acciones posibles
        model.add(keras.layers.Dense(action_shape, activation='linear'))

        # Se agregan los valores para el entrenamiento
        model.compile(loss=tf.keras.losses.Huber(), optimizer=tf.keras.optimizers.Adam(lr=self.learning_rate), metrics=['accuracy'])
        print(model.summary())
        return model

    def get_qs(self, state):
        main_model_pred = self.model.predict(state)[0]
        target_model_pred = self.target_model.predict(state)[0]
        return (main_model_pred, target_model_pred)


    '''
        Guarda la experiencia dentro de la replay memory
        
        observation: el estado
        action: el id de la acción tomada
        reward: el resultado de la función de recompensa
        new_observation: el estado resultante de ejecutar la acción
        done: si es que terminó la simulación. En nuestro caso cuando new_observation sea null


    '''
    def recolecta_experiencia(self, observation, action, reward, new_observation, done):
        self.replay_memory.append([observation, action, reward, new_observation, done]) 
        return 1

    def train(self):
        
        learning_rate = 0.7
        discount_factor = 0.618

        MIN_REPLAY_SIZE = 10
        if len(self.replay_memory) < MIN_REPLAY_SIZE:
            print("aún no")
            return

        batch_size = MIN_REPLAY_SIZE
        minibatch = random.sample(replay_memory, batch_size)

        current_states = np.array([transition[0] for transition in minibatch])
        current_qs_list = self.model.predict(current_states)

        new_current_states = np.array([transition[3] for transition in minibatch])
        future_qs_list = self.target_model.predict(new_current_states)

        X = []
        Y = []
        
        for index, (observation, action, reward, new_observation, done) in enumerate(mini_batch):
            if not done:
                max_future_q = reward + discount_factor * np.max(future_qs_list[index])
            else:
                max_future_q = reward
            
            current_qs = current_qs_list[index]
            current_qs[action] = (1-learning_rate) * current_qs[action] + learning_rate * max_future_q

            X.append(observation)
            Y.append(current_qs)

        self.model.fit(np.array(X), np.array(Y), batch_size=batch_size, verbose=0, shuffle=True)


    def test(self, df):
        x = df.drop('label', axis=1)        
        y = df['label']
        pred = [0 if d < 0.5 else 1 for d in self.model.predict(x)]
        from sklearn.metrics import recall_score
        from sklearn.metrics import confusion_matrix
        from sklearn.metrics import f1_score
        print(f1_score(pred, y, average='weighted')) 
