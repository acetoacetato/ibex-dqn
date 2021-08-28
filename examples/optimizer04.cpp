//============================================================================
//                                  I B E X
//
//                               ************
//                                  IbexOpt
//                               ************
//
// Author      : Gilles Chabert
// Copyright   : IMT Atlantique (France)
// License     : See the LICENSE file
// Last Update : Jul 09, 2017
//============================================================================

#include "ibex.h"
#include "parse_args.h"
#include "../src/optim/ibex_agent.h"

#include <sstream>
#include <cstring>
#include <fstream>
#include <string.h>
#include <stdio.h>

using namespace std;
using namespace ibex;

int main(int argc, char **argv)
{

#ifdef __IBEX_NO_LP_SOLVER__
	ibex_error("ibexopt requires a LP Solver (use --lp-lib with waf or -DLP_LIB with cmake)");
	exit(1);
#endif

	//FIXME: Acá hay que inicializar el agente
	srand(time(NULL)); //Randomize seed initialization
	agent::use_agent = 0;

	std::ofstream outfile;
	std::ofstream acciones;

	wchar_t *program = agent::inicializaPython("./foo");
	PyObject *agentModule = agent::importaModulo("agent");

	string filename = "benchs/optim/medium/ex5_3_2.bch";
	//agent::agente = agent::inicializaAgente(agentModule, "benchs/optim/medium/ex5_3_2.bch");

	string filt = "acidhc4", lr = "xn", bisect = "lsmearmg", strategy = "bs", beamsize = "1",
		   prec = "1.e-7", goal_prec = "1.e-6", timeout = "7200", rseed = "1", path = "";

	stringstream _rel_eps_f, _abs_eps_f, _eps_h, _random_seed, _eps_x;
	_rel_eps_f << "Relative precision on the objective. Default value is 1e" << round(::log10(OptimizerConfig::default_rel_eps_f)) << ".";
	_abs_eps_f << "Absolute precision on the objective. Default value is 1e" << round(::log10(OptimizerConfig::default_abs_eps_f)) << ".";
	_eps_h << "Equality relaxation value. Default value is 1e" << round(::log10(NormalizedSystem::default_eps_h)) << ".";
	_random_seed << "Random seed (useful for reproducibility). Default value is " << DefaultOptimizerConfig::default_random_seed << ".";
	_eps_x << "Precision on the variable (**Deprecated**). Default value is 0.";

	args::ArgumentParser parser("********* IbexOpt (defaultoptimizer) *********.", "Solve a Minibex file.");
	args::HelpFlag help(parser, "help", "Display this help menu", {'h', "help"});
	args::Flag version(parser, "version", "Display the version of this plugin (same as the version of Ibex).", {'v', "version"});
	args::ValueFlag<string> _filt(parser, "string", "Filtering method", {"filt"});
	args::ValueFlag<string> _lr(parser, "string", "Linear Relaxation method", {"lr"});
	args::ValueFlag<string> _bisect(parser, "string", "Bisection method", {"bis"});
	args::ValueFlag<string> _strategy(parser, "string", "Node selection strategy", {'s'});
	args::ValueFlag<string> _prec(parser, "string", "Precision", {"eps_x"});
	args::ValueFlag<string> _goal_prec(parser, "string", "Precision (objective value)", {"eps"});
	args::ValueFlag<string> _timeout(parser, "string", "Timeout (time in seconds)", {'t', "timeout"});
	args::ValueFlag<string> _rseed(parser, "string", "Random seed", {"seed"});
	args::ValueFlag<string> _path(parser, "string", "Path of selected nodes", {"path"});

	args::ValueFlag<double> initial_loup(parser, "float", "Intial \"loup\" (a priori known upper bound).", {"initial-loup"});
	args::Flag simulation(parser, "quiet", "Perform greedy simulations.", {"simulation"});
	args::Flag trace(parser, "trace", "Activate trace. Updates of loup/uplo are printed while minimizing.", {"trace"});
	args::Flag quiet(parser, "quiet", "Print no report on the standard output.", {'q', "quiet"});

	args::Positional<std::string> _filename(parser, "filename", "The name of the MINIBEX file.");

	try
	{
		parser.ParseCLI(argc, argv);
	}
	catch (args::Help &)
	{
		std::cout << parser;
		return 0;
	}
	catch (args::ParseError &e)
	{
		std::cerr << e.what() << std::endl;
		std::cerr << parser;
		return 1;
	}
	catch (args::ValidationError &e)
	{
		std::cerr << e.what() << std::endl;
		std::cerr << parser;
		return 1;
	}

	if (version)
	{
		cout << "IbexOpt Release " << _IBEX_RELEASE_ << endl;
		exit(0);
	}

	if (_filename.Get() == "")
	{
		ibex_error("no input file (try ibexopt --help)");
		exit(1);
	}

	try
	{
		if (_filename)
			filename = _filename.Get();
		if (_filt)
			filt = _filt.Get();
		if (_lr)
			lr = _lr.Get();
		if (_strategy)
			strategy = _strategy.Get();
		if (_bisect)
			bisect = _bisect.Get();
		if (_prec)
			prec = _prec.Get();
		if (_goal_prec)
			goal_prec = _goal_prec.Get();
		if (_timeout)
			timeout = _timeout.Get();
		if (_rseed)
			rseed = _rseed.Get();
		if (_path)
			path = _path.Get();

		char *argv[11];
		for (int i = 0; i < 11; i++)
			argv[i] = new char[30];
		strcpy(argv[1], filename.c_str());
		strcpy(argv[2], filt.c_str());
		strcpy(argv[3], lr.c_str());
		strcpy(argv[4], bisect.c_str());
		strcpy(argv[5], strategy.c_str());
		strcpy(argv[6], beamsize.c_str());
		strcpy(argv[7], prec.c_str());
		strcpy(argv[8], goal_prec.c_str());
		strcpy(argv[9], timeout.c_str());
		strcpy(argv[10], rseed.c_str());

		Optimizer04Config config(11, argv);

		// Build the default optimizer
		Optimizer o(config);

		// display solutions with up to 12 decimals
		cout.precision(12);

		if (!quiet)
			cout << "running............" << endl
				 << endl;

		if (initial_loup) // Search for the optimum
			o.optimize(config.sys->box, initial_loup.Get());
		else
			o.optimize(config.sys->box);

		if (trace)
			cout << endl;

		// Report some information (computation time, etc.)

		if (!quiet)
			o.report();

		return 0;
	}
	catch (ibex::UnknownFileException &e)
	{
		cerr << "Error: cannot read file '" << _filename.Get() << "'" << endl;
	}
	catch (ibex::SyntaxError &e)
	{
		cout << e << endl;
	}
}

