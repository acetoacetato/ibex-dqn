#include "ibex_agent.h"
#include "ibex.h"
namespace agent
{
    using namespace std;
    using boost::format;

    PyObject *agente = nullptr;
    std::vector<double> past_state;
    std::vector<double> future_state;

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
        PyTuple_SetItem(funcArgs, 1, PyFloat_FromDouble(sizeAction));

        PyObject *pIns = PyObject_CallObject(pConstruct, funcArgs);

        return pIns;
    }

    // ub, lb, UB, depth : del estado inicial
    // a: accion tomada (id o pos)
    // r(estado_inicial, accion): resultado función de recompensa
    // ub, lb, UB, depth: del estado futuro
    // done: si estado futuro es null
    int recolectaExperiencia(std::vector<double> &is, double r, std::vector<double> &fs, int done)
    {
        PyObject *entrada = creaLista(is);
        PyObject *futuro = creaLista(fs);
        PyObject *reward = PyFloat_FromDouble(r);
        PyObject *hecho = (done) ? Py_True : Py_False;
        cout << "Se colecta Experiencia" << endl;
        llamaFuncion("recolecta_experiencia", 4, entrada, reward, futuro, hecho);
        return 0;
    }

    PyObject *creaTupla(std::vector<double> &v)
    {
        PyObject *tupla = PyTuple_New(v.size());
        for (int i = 0; i < v.size(); i++)
        {
            PyTuple_SetItem(tupla, i, PyFloat_FromDouble(v[i]));
        }
        return tupla;
    }
    PyObject *creaLista(std::vector<double> &v)
    {
        PyObject *lista = PyList_New(v.size());
        for (int i = 0; i < v.size(); i++)
        {
            PyList_SetItem(lista, i, PyFloat_FromDouble(v[i]));
        }
        return lista;
    }

    std::vector<double> *tuplaOListaAvector(PyObject *in)
    {
        vector<double> *v = new vector<double>();
        if (PyTuple_Check(in))
        {
            for (Py_ssize_t i = 0; i < PyTuple_Size(in); i++)
            {
                PyObject *val = PyTuple_GetItem(in, i);
                v->push_back(PyFloat_AsDouble(val));
            }
        }
        else
        {
            if (PyList_Check(in))
            {
                for (Py_ssize_t i = 0; i < PyList_Size(in); i++)
                {
                    PyObject *val = PyList_GetItem(in, i);
                    v->push_back(PyFloat_AsDouble(val));
                }
            }
            else
            {
                throw logic_error("Pasado PyObject que no es tupla ni lista.");
            }
        }
        return v;
    }

    std::vector<double> *getQS(std::vector<double> &estado, int upd, int main)
    {
        if (!estado.size())
            return new std::vector<double>();
        PyObject *state = creaLista(estado);
        PyObject *update = (upd) ? Py_True : Py_False;
        PyObject *main_network = (main) ? Py_True : Py_False;
        PyObject *resultado = llamaFuncion("get_qs", 3, state, update, main_network);

        return tuplaOListaAvector(resultado);
    }

    PyObject *llamaFuncion(const char nombreFuncion[], int nargs, ...)
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
            if (PyTuple_SetItem(funcArgs, i, va_arg(args, PyObject *)))
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

    int seleccionaAccion(std::vector<double> &qs, int actualiza, int reduce)
    {
        PyObject *estado = creaLista(qs);
        PyObject *upd = (actualiza) ? Py_True : Py_False;
        PyObject *red = (reduce) ? Py_True : Py_False;

        PyObject *presult = llamaFuncion("select_qs", 3, estado, upd, red);

        return PyFloat_AS_DOUBLE(presult);
    }

    int entrena()
    {
        cout << "Se Entrena" << endl;
        PyObject *presult = llamaFuncion("train", 0);
        return 1;
    }

    int transfiere_pesos()
    {
        PyObject *presult = llamaFuncion("transfer_weights", 0);
        return 1;
    }

    int guarda_agente()
    {
        PyObject *presult = llamaFuncion("save_agent", 0);
        return 1;
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
