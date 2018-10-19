#include <stdio.h>
#include <stdlib.h>
#include <string> 
#include <iostream>

using namespace std;
int main() {

    FILE *f;
    char c;
    
    f=fopen("config.in","rt");
	string str;
    while((c=fgetc(f))!=EOF)
    {
		if(c!=' '){
			printf("%c",c);
		}
    }

    fclose(f);
    return 0;
}
