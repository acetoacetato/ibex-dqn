#ifndef __IBEX_AGENT_H__
#define __IBEX_AGENT_H__

#include <iostream>
#include <boost/format.hpp>
#include </usr/include/python3.6/Python.h>
#include <cstdarg>
#include <random>
// g++ -I/usr/include/python3.6/ main.cpp -L/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu -lpython3.6 -o main.o && ./main.o

namespace agent
{
	using namespace std;
	extern PyObject *agente;
	extern std::vector<double> past_state;
	extern std::vector<double> future_state;

	extern std::vector<int> acciones_tomadas;
	extern int n_iter;
	extern int depth;
	extern int generated_nodes;
	extern double time_taken;

	// 1= usar agente, 0= no usar agente
	extern int use_agent;

	PyObject *inicializaAgente(PyObject *modulo);

	PyObject *importaModulo(const string agent);
	wchar_t *inicializaPython(char const *argv);
	int recolectaExperiencia(std::vector<double> &is, double r, std::vector<double> &fs, int done);
	PyObject *llamaFuncion(const char nombreFuncion[], int nargs, ...);

	std::vector<double> *tuplaOListaAvector(PyObject *in);

	PyObject *creaTupla(std::vector<double> &v);
	PyObject *creaLista(std::vector<double> &v);
	int seleccionaAccion(std::vector<double> &qs, int actualiza, int reduce);
	std::vector<double> *getQS(std::vector<double> &estado, int upd, int main);
	int entrena();
	int transfiere_pesos();
	int guarda_agente();

	double punishment(int iterActual, int iterEsperada);
	double reward(double UB, double ub);
	double calculaRecompensa(double UB, double ub, int iterActual, int iterEsperada);

}

#endif