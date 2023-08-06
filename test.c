#include "lib.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void count_bits_test(){
  int i = count_bits(15);
  assert(i == 4);
  i = count_bits(-1);
  assert(i == 32);
};

// if the division n / 10 > 9
// it reads random values
void int_to_ascii_two_digits_test() {
  char * digits = malloc(sizeof(char) * 2);
  int_to_ascii_two_digits(15, digits);
  assert(strcmp(digits, "15") == 0);
  int_to_ascii_two_digits(99, digits);
  assert(strcmp(digits, "99") == 0);
}

void int_to_ascii_binary_test(int i) {
  int length = 32;
  char * digits = malloc(sizeof(char) * length);

  for (int i = 0; i < length; i++) {
    digits[i] = '\0'; 
  }

  char * pre = digits - 1;
  char * pos = digits + length;
  int_to_ascii_binary(i, digits);
  char * after_pre = digits - 1;
  char * after_pos = digits + length;
  assert(after_pre == pre);
  assert(after_pos == pos);
}

int main() {
  count_bits_test();
  int_to_ascii_two_digits_test();
  int_to_ascii_binary_test(15);
  int_to_ascii_binary_test(-1);
  int_to_ascii_binary_test(0xffffffff);

  return 0;
}
