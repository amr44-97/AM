#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>
#include "libstr.h"
#include "file_handle.h"



int main(int argc, char **argv){

    (void) argc;
    (void) argv;

    string max = newstr("hello iam groot and i am an x86_64 assembler!!");
      __str_println(max);
      printf("str.length = %lu\n",max.length);
      __str_cat(max, " Who are you!"); 
      __str_println(max);
      printf("str.length = %s\n",max.str);

}   


