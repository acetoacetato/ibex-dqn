#include "ibex_agent.h"
#include "ibex.h"
namespace agent
{
    using namespace std;
    using boost::format;

    PyObject *importaModulo(const string agent)
    {
        auto modulo = PyImport_ImportModule(agent.c_str());

        return modulo;
    }

    wchar_t *inicializaPython(char const *argv)
    {
        wchar_t *program = Py_DecodeLocale(argv, NULL);
        Py_SetProgramName(program);
        Py_Initialize();
        // Se agrega el directorio actual para poder importar cosas
        PyRun_SimpleString("import sys\n"
                           "sys.path.append('.')\n");
        return program;
    }

    PyObject *inicializaAgente(PyObject *modulo)
    {

        double sizeInput, sizeAction;
        sizeInput = 4.0;
        sizeAction = 2.0;

        PyObject *pDict = PyModule_GetDict(modulo);
        PyObject *pClase = PyDict_GetItemString(pDict, "Agent");
        PyObject *pConstruct = PyInstanceMethod_New(pClase);
        PyObject *funcArgs = PyTuple_New(2);

        PyTuple_SetItem(funcArgs, 0, PyFloat_FromDouble(sizeInput));
        PyTuple_SetItem(funcArgs, 1, PyFloat_FromDouble(sizeInput));

        PyObject *pIns = PyObject_CallObject(pConstruct, funcArgs);

        return pIns;
    }

    // ub, lb, UB, depth : del estado inicial
    // a: accion tomada (id o pos)
    // r(estado_inicial, accion): resultado función de recompensa
    // ub, lb, UB, depth: del estado futuro
    // done: si estado futuro es null
    int recolectaExperiencia(std::vector<double> &is, int a, double r, std::vector<double> &fs, int done)
    {
        cout << "Esto al menos ingresa" << endl;
        return 0;
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
}
