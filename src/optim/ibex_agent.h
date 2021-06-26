#ifndef __IBEX_AGENT_H__
#define __IBEX_AGENT_H__

#include <iostream>
#include <boost/format.hpp>
#include </usr/include/python3.6/Python.h>
#include <cstdarg>
// g++ -I/usr/include/python3.6/ main.cpp -L/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu -lpython3.6 -o main.o && ./main.o

namespace agent
{
	using namespace std;

	PyObject *importaModulo(const string agent);
	wchar_t *inicializaPython(char const *argv);
	PyObject *inicializaAgente(PyObject *modulo);
	void *llamaFuncion(PyObject *agente, const char nombreFuncion[], int nargs, ...);
	void *predice(void *datos);
	int recolectaExperiencia(std::vector<double> &is, int a, double r, std::vector<double> &fs, int done);
	double punishment(int iterActual, int iterEsperada);
	double reward(double UB, double ub);
	double calculaRecompensa(double UB, double ub, int iterActual, int iterEsperada);

}

#endif