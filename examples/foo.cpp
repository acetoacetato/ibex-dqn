#include "ibex.h"
#include "../src/optim/ibex_agent.h"
#include <iostream>
#include <string.h>
#include <fstream>

using namespace std;
using namespace ibex;

#ifndef IBEX_OPTIM_BENCHS_DIR

#define IBEX_OPTIM_BENCHS_DIR "../benchs/optim"

#endif

// ./foo nombre_instancia usar_agente
// Ejemplo: ./foo /medium/ex2_1_8.bch true
// Ejemplo: ./foo /medium/ex2_1_8.bch false
int main(int argc, char *argv[])
{

	//FIXME: Acá hay que inicializar el agente

	agent::use_agent = 0;
	cout << argv[2] << endl;
	if (strcmp(argv[2], "true") == 0)
	{
		cout << "Se usa el agente" << endl;
		agent::use_agent = 1;
	}

	std::ofstream outfile;

	outfile.open("metrics-script.txt", std::ios_base::app); // append instead of overwrite

	outfile << "\n\nInstancia: " << argv[2] << endl;
	outfile << "Agente: " << argv[1] << endl;

	std::string problem(argv[1]);

	wchar_t *program = agent::inicializaPython("./foo");
	PyObject *agentModule = agent::importaModulo("agent");

	if (agentModule == NULL)
	{
		cout << "Error: no se pudo importar el agente" << endl;
	}

	// Inicializa el agente
	agent::agente = agent::inicializaAgente(agentModule);

	string dir(IBEX_OPTIM_BENCHS_DIR);
	/* Build a constrained optimization problem from the file */
	System sys((dir + problem).c_str());

	/* Build a default optimizer with a precision set to 1e-07 for f(x) */
	DefaultOptimizer o(sys, 1e-07);

	o.optimize(sys.box); // Run the optimizer

	/* Display the result. */
	cout << "interval for the minimum: " << Interval(o.get_uplo(), o.get_loup()) << endl;
	cout << "minimizer: " << o.get_loup_point() << endl;

	outfile << "\tTime taken: " << agent::time_taken << endl;
	outfile << "\tGenerated nodes: " << agent::generated_nodes << endl;
	outfile << "\tIterations: " << agent::n_iter << endl;
	outfile << "\tAccion 0:" << agent::acciones_tomadas[0] << endl;
	outfile << "\tAccion 1:" << agent::acciones_tomadas[1] << endl;
	return 0;
}
