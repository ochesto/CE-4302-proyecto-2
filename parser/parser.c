#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

    FILE *f;
    char c;
   // string aux="";
    f=fopen("config.in","rt");
	
    while((c=fgetc(f))!=EOF)
    {
		if(c!=' '){
			printf("%c",c);
		}
    }

    fclose(f);
    return 0;
}
