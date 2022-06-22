#include <stdio.h>

int *a;
int b;
int **c;
int ***d;

void foo1();
void foo2();
void foo3();
void foo4();

void foo1() {
    int *g;
    int *j;
    int p;
   foo2();
   foo1();
   foo1();
}

void foo2() {
    int *g;
    int *j;
    int p;
   foo3();
}

void foo3() {
    int *g;
    int *j;
    int p;
   foo4();
   foo2();
}

void foo4() {
    int *g;
    int *j;
    int p;
   foo1();
   foo2();
   foo4();
}

int main() {
    int *g;
    int *j;
    int p;
   foo1();
}