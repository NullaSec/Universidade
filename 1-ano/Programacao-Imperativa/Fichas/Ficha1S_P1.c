// Ficha 1 Parte 1 - Primeiros Programas
#include <stdio.h>

int main(){
// 1. Estado e Atribuições - Escrever output do código
// a)
int x, y;
x = 3; y = x+1;
x = x*y; y = x + y;
printf("%d %d\n", x, y);
// x=3 y=4, x=3*4 y=(3*4)+4, x=12 y=16 Output: 12 16

// b)
int x, y;
x = 0;
printf ("%d %d\n", x, y);
// Dá erro, a variável y não está definida logo não é possível ser imprimida

// c)
char a, b, c;
a = "A"; b = " "; c = "0";
printf ("%c %d\n", a, a);
a = a+1; c = c+2;
printf ("%c %d %c %d\n", a, a, c, c);
c = a + b;
printf ("%c %d\n", c, c);
// Output 1: A 65 porque %c imprime o char e %d imprime o código ASCII já que só funciona para números inteiros.
// Output 2: B 66 2 50
// Output 3: B 98

// d)
int x, y;
x = 200; y = 100;
x = x+y; y = x-y; x = x-y;
printf ("%d %d\n", x, y);
// Output: 100 200

// 2. Estruturas de controlo - Escrever output do código
// a) 
int x, y;
x = 3; y = 5;
if (x > y)
y = 6;
printf ("%d %d\n", x, y);
// Output: 3 5 porque x < y logo o valor de y não se altera

// b) 
int x, y;
x = y = 0;
while (x != 11) {
    x = x+1; y += x;
}
printf ("%d %d\n", x, y);
// Output: 11 66 porque é um loop que vai aumentando os valores, como é que se justifica isto?

// c)
int i;
for (i=0; (i<20) ; i++)
if (i%2 == 0) putchar ("_");
else putchar ("#");
// Output: _#_#_#_#_#_#_#_#_#_# porque deus assim quis

// d)
void f (int n) {
    while (n>0) {
        if (n%2 == 0) putchar ("0");
        else putchar ("1");
        n = n/2;
    }
    putchar ("\n");
}
int main () {
    int i;
    for (i=0;(i<16);i++)
        f (i);
    return 0;
}
// Output: Sinceramente não sei, vou esperar pela resolução

return 0;
}