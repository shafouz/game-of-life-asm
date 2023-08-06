#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct lab_t {
  int index;
  int arr[];
};

typedef struct lab_t LabT;

int strukt(int argc, char *argv[])
{
  int array_size = 4;
  struct lab_t* instance = malloc(sizeof(struct lab_t) + array_size * sizeof(int));

  instance->index = 0x69;
  instance->arr[0] = 0x41;
  instance->arr[1] = 0x41;
  instance->arr[2] = 0x41;
  instance->arr[3] = 0x41;
  return 0;
}

void _remainder(){
  int i = 15 / 10;
  int k = 15 % 10;
  fprintf(stderr, "DEBUGPRINT[1]: lab.c:24: i=%d\n", i);
  fprintf(stderr, "DEBUGPRINT[3]: lab.c:27: k=%d\n", k);
  i = i / 10;
  k = k % 10;
  fprintf(stderr, "DEBUGPRINT[1]: lab.c:24: i=%d\n", i);
  fprintf(stderr, "DEBUGPRINT[3]: lab.c:27: k=%d\n", k);
}

void * ay(){
  return malloc(1);
}

void int_to_ascii_rev(int i, char * buf) {
  int eax = i;
  int ecx = 0;
  int edx = 0;


  while (eax != 0) {
    edx = eax % 10;
    eax = eax / 10;

    if (eax == 0) {
      eax ^= edx;
      edx ^= eax;
      eax ^= edx;
    }

    // happens every run
    buf[ecx] = eax + 0x30;
    eax = edx;
    ecx++;
  }
}

void nullterm(){
  char myArray[32] = "Hello"; // Not null-terminated
  int length = strlen(myArray); // Undefined behavior: strlen reads beyond the end of the string
  fprintf(stderr, "DEBUGPRINT[2]: lab.c:65: length=%d\n", length);
}

int main(){
  nullterm();

  return 0;
}
