#include "TablaASQL.cpp"
#include <fstream>

using namespace std;

int main(){
    std::ofstream salida("salida.txt");
    salida << leoTablaASQL() << "piloto.csv";
    return 0;
}