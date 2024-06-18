#include <string>
#include <cassert>

using namespace std;

//Split string inspirado en https://www.geeksforgeeks.org/how-to-split-a-string-in-cc-python-and-java/

/* 
Split String
PRE: palabras separadas por un caracter dentro de un string.
    El separador no esta ni en el primer ni en el ultimo caracter, ni aparece repetido.
POST: array con cada palabra separada
*/
string* splitString(string str, char c){
    int cantPalabras = 1;

    for (unsigned int i = 0; i < str.size(); i++){
        if (str[i] == c)
            cantPalabras++;
    }

    string* res = new string[cantPalabras];
    string pal = "";

    int palActual = 0;

    for (unsigned int i = 0; i < str.size(); i++){
        if (str[i] == c){
            res[palActual] = pal;
            pal = "";
            palActual++;
        }
        else{
            pal += str[i];
        }
    }

    if (pal != ""){
        res[palActual] = pal;
    }

    return res;
}

string toUpper(string str){
    //TO DO
    return "";
}