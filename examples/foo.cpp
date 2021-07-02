#include "ibex.h"
#include "../src/optim/ibex_agent.h"
#include <iostream>
using namespace std;
using namespace ibex;

#ifndef IBEX_OPTIM_BENCHS_DIR

#define IBEX_OPTIM_BENCHS_DIR "../benchs/optim"

#endif

int main()
{

	//FIXME: Acá hay que inicializar el agente

	wchar_t *program = agent::inicializaPython("./foo");
	PyObject *agentModule = agent::importaModulo("agent");

	if (agentModule == NULL)
	{
		cout << "Error: no se pudo importar el agente" << endl;
	}

	// Inicializa el agente
	agent::agente = agent::inicializaAgente(agentModule);

	/* Build a constrained optimization problem from the file */
	System sys(IBEX_OPTIM_BENCHS_DIR "/medium/ex2_1_8.bch");

	/* Build a default optimizer with a precision set to 1e-07 for f(x) */
	DefaultOptimizer o(sys, 1e-07);

	o.optimize(sys.box); // Run the optimizer

	/* Display the result. */
	cout << "interval for the minimum: " << Interval(o.get_uplo(), o.get_loup()) << endl;
	cout << "minimizer: " << o.get_loup_point() << endl;
	return 0;
}
