#include <stdio.h>

// Taken from http://stackoverflow.com/questions/3536153/c-dynamically-growing-array

typedef struct {
  int *array;
  size_t used;
  size_t size;
} Array;

void initArray(Array *a, size_t initialSize) {
  a->array = (int *)malloc(initialSize * sizeof(int));
  a->used = 0;
  a->size = initialSize;
}


void insertArray(Array *a, int element) {
  if (a->used == a->size) {
    a->size *= 2;
    a->array = (int *)realloc(a->array, a->size * sizeof(int));
  }
  a->array[a->used++] = element;
}

void freeArray(Array *a) {
  free(a->array);
  a->array = NULL;
  a->used = a->size = 0;
}


int contains(Array *a, int target) {

  int i;
  for (i = 0; i < a->size; i++) {
    if (a->array[i] == target) {
      return 1;
    }

  }
  return 0;

}

int main (int argc, char *argv[]) {

  int groupsize = argv[2];
  int studentAmount = argv[1];
  Array students[studentAmount];
  int i;

  printf("The groupsize %d The students %d", groupsize, studentAmount);

  for (i = 0; i < 8; i++ ) {
  
    printf("Assignment %d ", i+1);
    int j;
    int counter = 0;
    for (j = 0; j < studentAmount; j++) {
      printf("( %d", j+1);
      int k;
      for (k = 0; k < studentAmount; k++) {
      
	if ((!contains(students[j], k)) && counter < groupsize) {
	  insertArray(students[j], k);
	  insertArray(students[k], j);
	  counter= counter + 1;
	  printf(", %d", k+1);
	  
	 }      
      }
      printf(") /n");
    }
  } 
}

