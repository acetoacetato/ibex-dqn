#define PY_SSIZE_T_CLEAN
#include <iostream>
#include <boost/format.hpp>
#include </usr/include/python3.6/Python.h>
#include <cstdarg>

// g++ -I/usr/include/python3.6/ main.cpp -L/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu -lpython3.6 -o main.o && ./main.o

using namespace ::std;
using boost::format;

PyObject *inicializaAgente(PyObject *);
double punishment(int, int);
double reward(double, double);
double calculaRecompensa(double, double, int, int);
wchar_t *inicializaPython(char const *[]);
PyObject *importaModulo(string);
void *llamaFuncion(PyObject *, const char[], int, ...);

int main(int const argc, char const *argv[])
{

	wchar_t *program = inicializaPython(argv);
	PyObject *agentModule = importaModulo("agent");

	if (agentModule == NULL)
	{
		cout << "Error: no se pudo importar el agente" << endl;
		return -1;
	}
	PyObject *pDict = PyModule_GetDict(agentModule);

	PyObject *pClassSecond = PyDict_GetItemString(pDict, "Agent");

	PyObject *pConstruct = PyInstanceMethod_New(pClassSecond);

	PyObject *funcArgs = PyTuple_New(2);

	PyTuple_SetItem(funcArgs, 0, PyFloat_FromDouble(2.0));
	PyTuple_SetItem(funcArgs, 1, PyFloat_FromDouble(1.0));

	PyObject *pIns = inicializaAgente(agentModule);

	llamaFuncion(pIns, "pruebaInnit", 2, 1.0, 2.2);

	if (Py_FinalizeEx() < 0)
	{
		PyMem_RawFree(program);
		return -1;
	}
	PyMem_RawFree(program);
	return 0;
}

PyObject *importaModulo(const string agent)
{
	auto modulo = PyImport_ImportModule(agent.c_str());

	return modulo;
}

wchar_t *inicializaPython(char const *argv[])
{
	wchar_t *program = Py_DecodeLocale(argv[0], NULL);
	Py_SetProgramName(program);
	Py_Initialize();
	// Se agrega el directorio actual para poder importar cosas
	PyRun_SimpleString("import sys\n"
					   "sys.path.append('.')\n");
	return program;
}

PyObject *inicializaAgente(PyObject *modulo)
{

	int sizeInput, sizeAction;
	sizeInput = 2;
	sizeAction = 1;

	PyObject *pDict = PyModule_GetDict(modulo);
	PyObject *pClase = PyDict_GetItemString(pDict, "Agent");
	PyObject *pConstruct = PyInstanceMethod_New(pClase);
	PyObject *funcArgs = PyTuple_New(2);

	PyTuple_SetItem(funcArgs, 0, PyFloat_FromDouble(sizeInput));
	PyTuple_SetItem(funcArgs, 1, PyFloat_FromDouble(sizeInput));

	PyObject *pIns = PyObject_CallObject(pConstruct, funcArgs);

	return pIns;
}

void *llamaFuncion(PyObject *agente, const char nombreFuncion[], int nargs, ...)
{
	// punteros a la función y al resultado
	PyObject *pFunc, *presult;
	// Parámetros variables
	va_list args;
	va_start(args, nargs);

	// Se forma el objeto de parámetros
	PyObject *funcArgs = PyTuple_New(nargs);
	for (int i = 0; i < nargs; i++)
	{
		if (PyTuple_SetItem(funcArgs, i, PyFloat_FromDouble(va_arg(args, double))))
		{
			cout << "Falló el inicializado de las variables" << endl;
			return nullptr;
		}
	}

	PyErr_Print();
	pFunc = PyObject_GetAttrString(agente, nombreFuncion);

	presult = PyObject_CallObject(pFunc, funcArgs);
	PyErr_Print();

	return presult;
}

void *predice(void *datos)
{
	string linea = str(format("predict(%1%, %2%)"));
	return NULL;
}

double punishment(int iterActual, int iterEsperada)
{
	if (iterActual <= iterEsperada)
	{
		return iterActual - iterEsperada;
	}
	return 0;
}

double reward(double UB, double ub)
{
	if (UB > ub)
	{
		return (UB - ub) / UB;
	}
	return 0;
}

double calculaRecompensa(double UB, double ub, int iterActual, int iterEsperada)
{
	return reward(UB, ub) - punishment(iterActual, iterEsperada);
}
