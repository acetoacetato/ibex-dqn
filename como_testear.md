./waf configure --lp-lib=soplex
sudo ./waf install
cd examples
rm foo
make foo 
./foo
