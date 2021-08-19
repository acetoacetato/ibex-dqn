#!/bin/bash
cd .. ; 
./waf configure --lp-lib=soplex && sudo ./waf install ;
cd examples/ ;
rm foo ; 
make foo ;
#./foo /hard/chembis.bch true;
./experimentos.bash $1