#define PY_SSIZE_T_CLEAN
#include <iostream>
#include </usr/include/python3.6/Python.h>

// g++ -I/usr/include/python3.6/ main.cpp -L/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu -lpython3.6 -o main.o && ./main.o

using namespace::std;


int main(int argc, char const* argv[]){
    wchar_t *program = Py_DecodeLocale(argv[0], NULL);
    if (program == NULL) {
        fprintf(stderr, "Fatal error: cannot decode argv[0]\n");
        exit(1);
    }
    Py_SetProgramName(program);  /* optional but recommended */
    Py_Initialize();
    PyRun_SimpleString("import pandas as pd\n"
		       "import torch\n" 
                       "df = pd.read_csv('test.csv')\n"
		       "print(df.head())\n");
    if (Py_FinalizeEx() < 0) {
        exit(120);
    }
    PyMem_RawFree(program);
    return 0;

}
