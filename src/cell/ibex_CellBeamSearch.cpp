//============================================================================
//                                  I B E X
// File        : ibex_CellBeamSearch.cpp
// Author      : Bertrand Neveu
// Copyright   : IMT Atlantique (France)
// License     : See the LICENSE file
// Created     : Aug 29, 2017
// Modified    : Sep 07, 2017
//============================================================================

#include "ibex_CellBeamSearch.h"
#include <random>
#include "ibex_agent.h"
#include <iostream>
#include <time.h>

using namespace std;

namespace ibex
{

	CellBeamSearch::CellBeamSearch(CellHeap &currentbuffer, CellHeap &futurebuffer, const ExtendedSystem &sys, unsigned int beamsize) : CellHeap(sys), beamsize(beamsize), currentbuffer(currentbuffer), futurebuffer(futurebuffer)
	{
	}

	CellBeamSearch::~CellBeamSearch()
	{
	}

	bool CellBeamSearch::empty() const
	{
		return (currentbuffer.empty() && futurebuffer.empty() && CellHeap::empty());
	}

	unsigned int CellBeamSearch::size() const
	{
		return (currentbuffer.size() + futurebuffer.size() + CellHeap::size());
	}

	void CellBeamSearch::flush()
	{
		currentbuffer.flush();
		futurebuffer.flush();
		CellHeap::flush();
	}

	void CellBeamSearch::contract(double new_loup)
	{

		if (!(CellHeap::empty()))
			Heap<Cell>::contract(new_loup);

		if (!(currentbuffer.empty()))
			currentbuffer.contract(new_loup);

		if (!(futurebuffer.empty()))
		{
			futurebuffer.contract(new_loup);
		}
	}

	void CellBeamSearch::push(Cell *cell)
	{
		futurebuffer.push(cell);
	}

	double CellBeamSearch::cell_cost(const Cell &cell) const
	{
		return cell.box[sys.goal_var()].lb();
	}

	// returns the cell to handled
	Cell *CellBeamSearch::pop()
	{
		int accion = 1;
		cout << "Aloh" << endl;
		//accion = rand() % 2; // Generate a random number between 0 and 1

		if (agent::use_agent && agent::past_state.size())
		{
			//dive or not dive
			std::vector<double> *qs = agent::getQS(agent::past_state, 1, (agent::n_iter % 20 == 0) ? 1 : 0);
			accion = agent::seleccionaAccion(*qs, 1, 1);
		}
		else
		{
			//dive
			accion = 1;
		}

		// Guardar cantidad de acciones por c/u
		//agent::acciones_tomadas[accion] = agent::acciones_tomadas[accion] + 1;
		cout << "Aloh93" << endl;
		// Ver evolución de las acciones tomadas
		//agent::acciones_tomadas.push_back(accion);

		if (accion && !(currentbuffer.empty()))
			return currentbuffer.pop();
		else if (!(futurebuffer.empty()))
		{
			Cell *c = futurebuffer.pop();
			//cout << c->depth << " | " << c->box.lb() << " | " << c->box.ub() << endl;
			move_buffers();
			return c;
		}
		cout << "Aloh106" << endl;
		return CellHeap::pop();
		
		


		
	}

	// emptying the futurebuffer : buffersize-1 cells are put into
	// the currentbuffer , the remaining into the global heap
	void CellBeamSearch::move_buffers()
	{

		while (!(futurebuffer.empty()))
		{
			if (currentbuffer.size() < beamsize - 1)
				currentbuffer.push(futurebuffer.pop());
			else
				CellHeap::push(futurebuffer.pop());
		}
	}

	Cell *CellBeamSearch::top() const
	{

		if (!(currentbuffer.empty()))
		{
			return currentbuffer.top();
		}
		else if (!(futurebuffer.empty()))
		{
			return futurebuffer.top();
		}
		else
		{
			return CellHeap::top();
		}
	}

	// the minimum of all open nodes
	double CellBeamSearch::minimum() const
	{
		assert(!(empty()));
		if (!(currentbuffer.empty()) && !(futurebuffer.empty()) && (!CellHeap::empty()))
		{
			//      cout << "minimum " << currentbuffer.minimum() << "  " << futurebuffer.minimum() <<  " " << CellHeap::minimum() << endl;
			return std::min(currentbuffer.minimum(), std::min(futurebuffer.minimum(), CellHeap::minimum()));
		}
		else if (!(currentbuffer.empty()) && !CellHeap::empty())
			return std::min(currentbuffer.minimum(), CellHeap::minimum());
		else if (!(futurebuffer.empty()) && !CellHeap::empty())
			return std::min(futurebuffer.minimum(), CellHeap::minimum());
		else if (!(futurebuffer.empty()) && !currentbuffer.empty())
			return std::min(futurebuffer.minimum(), currentbuffer.minimum());
		else if (!(futurebuffer.empty()))
			return futurebuffer.minimum();
		else if (!(currentbuffer.empty()))
			return currentbuffer.minimum();
		else
			return CellHeap::minimum();
	}

} // end namespace
