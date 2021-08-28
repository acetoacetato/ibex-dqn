#!/bin/bash
cd .. ; 
./waf configure --lp-lib=soplex && sudo ./waf install ;
cd examples/ ;
rm optimizer04 ; 
make optimizer04;
./optimizer04 /home/alen/ibex-lib/benchs/optim/medium/ex2_1_7.bch 
#./experimentos.bash $1
