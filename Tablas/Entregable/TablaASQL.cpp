#include <string>
#include <iostream>
#include <cmath>
#include "strings.cpp"

//using namespace std;

string salidaInsercion(string nombre, string* nombreColumnas, string* columnas, bool* comillas, int cantColumnas){
    //cabezal
    string salida = "";
    salida  = "INSERT INTO " + nombre + "(" + nombreColumnas[0];
    
    //si hay mas de una columna
    for (int i = 1; i < cantColumnas; i++){
        salida += ", " + nombreColumnas[i];
    }
    salida += ")\n";
    
    //valores
    salida += "VALUES\n";
    salida +="(";
    
    if (comillas[0]) 
        salida += "'";
    
    salida += columnas[0];
    
    if (comillas[0])
        salida += "'";

    //si hay mas de una columna
    for (int i = 1; i < cantColumnas; i++){
        salida += ", ";
        if (comillas[i])
            salida += "'";
        
        salida += columnas[i];
        
        if (comillas[i])
            salida += "'";
    }

    return salida +");\n";
}

string leoTablaASQL(){
    string nombre;
    int cantCol;
    string lineaLectura;
    bool* comillas;
    string salida = "";


    //guardo lectura en lectura,
    getline(cin,lineaLectura);
    string* lecturas = splitString(lineaLectura,';');
    
    //leo nombre y cantidad de columnas
    nombre = lecturas[0];
    cantCol = stoi(lecturas[1]);

    //Leo nombre columnas y las guardo
    string* nombreColumnas = new string[cantCol]();
    getline(cin,lineaLectura);
    lecturas = splitString(lineaLectura,';');
    for (int i = 0; i < cantCol; i++){
        nombreColumnas[i] = lecturas[i];
    }

    //leo si los valores tienen comillas
    getline(cin,lineaLectura);
    lecturas = splitString(lineaLectura,';');
    comillas = new bool[cantCol];
    for (int i = 0; i < cantCol; i++){
        if (lecturas[i] == "SI" || lecturas[i] == "SÍ" ||
            lecturas[i] == "si" || lecturas[i] == "sí")
            comillas[i] = true;
        else    
            comillas[i] = false;
    }

    //leo filas y las imprimo
    while (lineaLectura.length() > 0){
        getline(cin,lineaLectura);

        if (lineaLectura.length() == 0){
            break;
        }

        lecturas = splitString(lineaLectura,';');

        salida += salidaInsercion(nombre, nombreColumnas, lecturas, comillas, cantCol);
    }

    return salida;
}

/*
* PRE: Archivo en .csv de UNA tabla (ver ejemplo)
* POST: INSERTs de la tabla
* PARA ARCHIVOS DE SALIDA, USAR '<' '>'
* tablasASQL.exe < avion.csv > avion.txt
*/
int main(){
    string nombre;
    int cantCol;
    string lineaLectura;
    bool* comillas;
    
    //guardo lectura en lectura,
    getline(cin,lineaLectura);
    string* lecturas = splitString(lineaLectura,';');
    
    //leo nombre y cantidad de columnas
    nombre = lecturas[0];
    cantCol = stoi(lecturas[1]);

    //Leo nombre columnas y las guardo
    string* nombreColumnas = new string[cantCol]();
    getline(cin,lineaLectura);
    lecturas = splitString(lineaLectura,';');
    for (int i = 0; i < cantCol; i++){
        nombreColumnas[i] = lecturas[i];
    }

    //leo si los valores tienen comillas
    getline(cin,lineaLectura);
    lecturas = splitString(lineaLectura,';');
    comillas = new bool[cantCol];
    for (int i = 0; i < cantCol; i++){
        if (lecturas[i] == "SI" || lecturas[i] == "SÍ" ||
            lecturas[i] == "si" || lecturas[i] == "sí")
            comillas[i] = true;
        else    
            comillas[i] = false;
    }

    //leo filas y las imprimo
    while (lineaLectura.length() > 0){
        getline(cin,lineaLectura);

        if (lineaLectura.length() == 0){
            break;
        }

        lecturas = splitString(lineaLectura,';');

        cout << salidaInsercion(nombre, nombreColumnas, lecturas, comillas, cantCol);
    }

    return 0;


}