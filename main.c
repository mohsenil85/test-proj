#include <stdio.h>
#include <unistd.h>
#include "add_two_numbs.h"


int main(void){
  int input, a, b, x;
  printf("Enter first numb\n");
  printf(">  ");
  scanf("%d", &input);
  a = input;
  printf("Enter second numb\n");
  printf(">  ");
  scanf("%d", &input);
  b = input;
  x = add_two_numbs(a, b);
  for (int i = 0; i < 5; i++){
    printf("CALCULATING...\n");
    sleep(2);
  }
  printf("****\n");
  printf("%d + %d = %d\n", a, b, x);
  return 0;
}

