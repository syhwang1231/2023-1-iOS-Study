#include <stdio.h>
int main()
{
    int c;

    while((c=getchar()) !=EOF){
    print("%d  %c",c,c);
    putchar(c);
    }
}