./waf configure --lp-lib=soplex
./waf install
cd examples
rm foo
make foo 
./foo
