#include <stdio.h>

void foo1();
void foo2();
void foo3();
void foo4();

void foo1() {
   foo2();
   foo1();
   foo1();
}

void foo2() {
   foo3();
}

void foo3() {
   foo4();
   foo2();
   main();
}

void foo4() {
   foo1();
   foo2();
   foo4();
}

int main() {
   foo1();
}