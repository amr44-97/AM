#include "LibStr.h"
#include "error_out.h"
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define __STRING_STACK_SIZE 20000
//#define __MIN_LIST__STR_ 800

/*
 * TODO
 * 1- add input Strings [X]
 * 2- add empty Strings [X] StringBuild("")
 * 3- add newstr with defined size [X]
 * 4- add subString function [X]
 *
 * 5- concat more than one sting at once Str_cat(String var,...)
 *
 */

// a container to all the allocatoins

void *__STRING_STACK[__STRING_STACK_SIZE] = {NULL};
void *__MARKED_FREE[__STRING_STACK_SIZE] = {NULL};

// static void* __STRING_REALLOC[__STRING_STACK_SIZE] = {NULL};

__attribute__((always_inline)) static inline void 
add_strptr_stack(void *__str);

__attribute__((always_inline)) static inline void
update_ptr_pointer(void *old_ptr, void *new_ptr);

__attribute__((always_inline)) static inline int
check_marked_free(String __str);

__attribute__((always_inline)) static inline int
check_marked_free_ptr(char *__str);

// counter to the allocations
static unsigned int __stack_pos = 0;
// counter to freed memory
static unsigned int __Marked_Free_POS = 0;

__attribute__((always_inline)) static inline void
add_strptr_stack(void *__str) {
  __STRING_STACK[__stack_pos++] = __str;
  // __stack_pos++;
}

__attribute__((always_inline)) static inline void
update_ptr_pointer(void *old_ptr, void *new_ptr) {
  for (int i = 0; i < (int)__stack_pos; i++) {
    if (__STRING_STACK[i] == old_ptr) {
      __STRING_STACK[i] = new_ptr;
    }
  }
}

void print_alloc_info() {
  puts("===================MEMORY "
       "INFO==========================================");
  printf("||\t\t\t\t\t\t\t");
  printf("\t\t||\n");
  printf("||\t");
  printf("\tAllocated pointers = %u", __stack_pos);
  printf("\t\t\t\t\t||\n");
  printf("||\t");
  printf("\tFreed pointers = %u", __Marked_Free_POS);
  printf("\t\t\t\t\t||\n");
  printf("||\t\t\t\t\t\t\t");
  printf("\t\t||\n");
  puts("======================================================================="
       "==");
}

void Str_free_all() {
  int tmp = (int)__stack_pos;
  for (int i = 0; i < tmp; i++) {
    __MARKED_FREE[__Marked_Free_POS] = __STRING_STACK[i];
    free(__STRING_STACK[i]);
    __STRING_STACK[i] = NULL;
    __Marked_Free_POS++;
    __stack_pos--;
  }
 __stack_pos = 0;
}

// void  Str_free_all(){
//     for(;__stack_pos > 0 ; __stack_pos--){
//             free(__STRING_STACK[__stack_pos]);
//             __STRING_STACK[__stack_pos]=NULL;
//     }
//     free(__STRING_STACK[__stack_pos]);
//     __STRING_STACK[__stack_pos] = NULL;
//     printf("Stack Pos = %i\n",__stack_pos);
// }

void free_str(String __str) {
  if (__stack_pos > 0) { // check for elements before going on
    for (int i = 0; i < (int)__stack_pos; i++) {
      if (__STRING_STACK[i] == __str.str) {
        if (check_marked_free_ptr(__str.str)) {
          continue;
        }
        __MARKED_FREE[__Marked_Free_POS] = __STRING_STACK[i];
        free(__STRING_STACK[i]);
        __STRING_STACK[i] = NULL;
        __Marked_Free_POS++;
        __stack_pos--;
        break;
      }
    }
  }
}

String StringBuild_s(char *__str, size_t size) {
  const unsigned int len = size;
  //[NOTE]  undefined behavior with non-null terminated Strings
  //[NOTE]    // TODO fix undefined behavior
  String __local;
  __local.str = (char *)malloc((len + 1) * sizeof(char));
  __local.length = len ;
  __local.capacity = len +1;

  //[NOTE]   // Valgrind gives error when copying to not enough space
  memccpy(__local.str, __str, '\0', len + 1);
  add_strptr_stack(__local.str);
  __local.str[len] = '\0';
  return __local;
}

String StringBuild(char *__str) {
  const unsigned int len = strlen(__str);
  //[NOTE]  undefined behavior with non-null terminated Strings
  //[NOTE]    // TODO fix undefined behavior
  String __local = {0,0,NULL};
  __local.str = (char *)malloc((len + 1) * sizeof(char));
  memcpy(__local.str, __str, len + 1);
  __local.length = len ;
  __local.capacity = len ;

  //[NOTE]   // Valgrind gives error when copying to not enough space
  add_strptr_stack(__local.str);
  __local.str[len] = '\0';
  return __local;
}

__attribute__((always_inline)) static inline int
check_marked_free(String __str) {
  int no_err = 0;
  if (__Marked_Free_POS > 0) {
    for (int i = 0; i < (int)__Marked_Free_POS; i++) {
      if (__str.str == __MARKED_FREE[i]) {
        fprintf(stderr, ANSI_COLOR_YELLOW
                "[ERROR:] Using marked free ptr\n" ANSI_COLOR_RESET);
        no_err = 1;
      }
    }
  }
  return no_err;
}

__attribute__((always_inline)) static inline int
check_marked_free_ptr(char *__str) {
  int no_err = 0;
  if (__Marked_Free_POS > 0) {
    for (int i = 0; i < (int)__Marked_Free_POS; i++) {
      if ((void *)__str == __MARKED_FREE[i]) {
        fprintf(stderr, ANSI_COLOR_YELLOW
                "[ERROR:] Using marked free ptr\n" ANSI_COLOR_RESET);
        no_err = 1;
      }
    }
  }
  return no_err;
}

String Str_copy(String __str) {

  if (__str.str == NULL) {
    fprintf(stderr, ANSI_COLOR_RED
            "[ERROR:] copying from empty [NULL] String\n" ANSI_COLOR_RESET);
    exit(-1);
  }
  if (check_marked_free(__str)) {
    fprintf(stderr, ANSI_COLOR_RED
            "[ERROR:] copying from unaccessable String\n" ANSI_COLOR_RESET);
    exit(-1);
  }
  const unsigned int len = __str.length;
  String __local = {.str = (char *)malloc((len + 1) * sizeof(char)),
                    .length = len};

  memccpy(__local.str, __str.str, '\0', len);

  add_strptr_stack(__local.str);
  return __local;
}

// output functions

void Str_println(String __str) {

  if (check_marked_free_ptr(__str.str) || __str.str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED
            "[ERROR]:print error using a freed String at" ANSI_COLOR_MAGENTA
            " [ %s:%d , %s()]\n" ANSI_COLOR_RESET,
            __FILE__, __LINE__, __func__);
    exit(1);
  }

  write(1, __str.str, __str.capacity);
  write(1, "\n", 1);
}

void Str_print(String __str) {
  if (check_marked_free_ptr(__str.str) || __str.str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED
            "[ERROR]:print error using a freed String at" ANSI_COLOR_MAGENTA
            " [ %s:%d , %s()]\n" ANSI_COLOR_RESET,
            __FILE__, __LINE__, __func__);
    exit(1);
  }
  write(1, __str.str, __str.capacity);
}

void list_print(Str_list __lis) {

  printf("{");
  for (int i = 0; i < (int)__lis.length; ++i) {
    if (i == (int)(__lis.length )) {
      printf("\"%s\" ", __lis.ptr[i].str);
      // Str_println(__lis.ptr[i]);
    } else {
      printf("\"%s\", ", __lis.ptr[i].str);
      // Str_println(__lis.ptr[i]);
    }
  }
  printf("}\n");
}

void printlis(list __lis) {

  printf("{");
  for (int i = 0; i < (int)__lis.length; ++i) {
    if (i == (int)(__lis.length )) {
      printf("\"%s\" ",(char*) __lis.ptr[i]);
      // Str_println(__lis.ptr[i]);
    } else {
      printf("\"%s\", ",(char*) __lis.ptr[i]);
      // Str_println(__lis.ptr[i]);
    }
  }
  printf("}\n");
}

__attribute__((always_inline)) inline int Str_find_char(String __str,
                                                        char element) {
  _pos __curr_pos = 0;
  for (int i = 0; i < (int)__str.length; i++) {
    if (__str.str[i] == element) {
      __curr_pos = i;
      break;
    }
  }
  return (int)__curr_pos;
}

// TODO allow split to take array of delimeters [DONE #cf1FFFFF]

#define _SKIP_IF(X, Z)                                                         \
  if ((X) == (Z)) {                                                            \
    continue;                                                                  \
  }

list Str_split(String strc) {

  if (strc.str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED
            "[ERROR]: Str_split error using a NULL String at" ANSI_COLOR_MAGENTA
            " [ %s:%d , %s()]\n" ANSI_COLOR_RESET,
            __FILE__, __LINE__, __func__);
    exit(1);
  }

  size_t __len = strc.length;
  list new_list = {.ptr = malloc((__len) * sizeof(char *)), .length = 0};
  add_strptr_stack(new_list.ptr);

  char *old_list =  calloc((__len + 1) , sizeof(char));
  memcpy(old_list, strc.str, __len);
  add_strptr_stack(old_list);

  char *ptr_listclone = &old_list[0];
  new_list.ptr[0] = ptr_listclone;
  int i = 0, x = 0;
  for (; old_list[i] != '\0';) {
    if ((old_list[i] == ' ' && old_list[i + 1] != ' ') || old_list[i] == '\n') {
      old_list[i] = '\0';
      ptr_listclone = &old_list[i + 1];
      new_list.ptr[x + 1] = ptr_listclone;
      x++;
    }
    i++;
  }
  new_list.length = x + 1;
  return new_list;
}

list Str_split_delim(char *strc, const char delimeter[]) {

  int __len = strlen(strc);
  int del = (int)strlen(delimeter);
  list new_list = {.ptr = malloc((__len) * sizeof(char *)), .length = 0};
  add_strptr_stack(new_list.ptr);

  char *old_list = malloc((__len + 1) * sizeof(char));
  memcpy(old_list, strc, __len);
  add_strptr_stack(old_list);

  char *ptr_listclone = NULL;
  ptr_listclone = &old_list[0];
  new_list.ptr[0] = ptr_listclone;
  int i = 0, x = 0;
  int del_i = 0;

  if (del == 1) {
    for (; old_list[i] != '\0';) {
      if (old_list[i] == delimeter[0]) {
        old_list[i] = '\0';
        ptr_listclone = &old_list[i + 1];
        new_list.ptr[x + 1] = ptr_listclone;
        x++;
      }
      i++;
    }
    new_list.length = x + 1;
    return new_list;
  } else {
    for (; old_list[i] != '\0';) {
      del_i = 0;
      for (; del_i < del; del_i++) {
        if (old_list[i] == delimeter[del_i]) {
          old_list[i] = '\0';
          ptr_listclone = &old_list[i + 1];
          new_list.ptr[x + 1] = ptr_listclone;
          x++;
        }
      }
      i++;
    }
    new_list.length = x + 1;
    return new_list;
  }
}

//__attribute__((always_inline)) static inline void
//add_Str_list_stack(String *__str) {
//  __STRING_STACK[__stack_pos] = __str->str;
 // __stack_pos++;
//}

// implement using substr and newstr
// TODO
/*
 * 1- ignore tokenizing whitespaces [X]
 * 2- add more functions
 *
 *
 * */

static void __Str_check_error(String __str) {
  if (__str.str == NULL) { //|| __str.length == 0){
    fprintf(stderr, ANSI_COLOR_RED
            "[ERROR]: unaccessable OR empty String\n" ANSI_COLOR_RESET);
    exit(-1);
  }
}

static void __char_check_error(const char *__str) {
  if (__str == NULL) {
    fprintf(stderr, ANSI_COLOR_RED
            "[ERROR]: unaccessable OR empty char ptr\n" ANSI_COLOR_RESET);
    exit(-1);
  }
}




// depend on strcat and somtimes doesn't work .

void Str_cat(String *__str, const char *__char) {
  __Str_check_error(*__str);
  __char_check_error(__char);

  if (__str->str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED "[ERROR]:using a freed String at" ANSI_COLOR_MAGENTA
                           " [ %s:%d , %s()]\n" ANSI_COLOR_RESET,
            __FILE__, __LINE__, __func__);
    exit(1);
  }
  //
  
  char *old_ptr = __str->str;
  size_t newln = strlen(__char);
  __str->str  =  realloc(__str->str,__str->length + newln +1 );
  __str->str  = strcat(__str->str,__char);

  update_ptr_pointer(old_ptr, __str->str);
}




// made from scratch  uses memcpy.

void Str_cat_m(String *__str, const char *__char) {
  __Str_check_error(*__str);
  __char_check_error(__char);

  if (__str->str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED "[ERROR]:using a freed String at" ANSI_COLOR_MAGENTA
                           " [ %s:%d , %s()]\n" ANSI_COLOR_RESET,
            __FILE__, __LINE__, __func__);
    exit(1);
  }
  //

  size_t strlen_s = __str->length ;
  size_t strlen_char = strlen(__char);
  size_t total = strlen_s + strlen_char;

  char *old_ptr = __str->str;
  __str->str = realloc(__str->str, (total + 1) * sizeof(char));
  update_ptr_pointer(old_ptr, __str->str);

  if (__str->str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED "[ERROR]: failed to reallocarray at "
                           "[Str_cat(),libstr.c:%d]\n" ANSI_COLOR_RESET,
            __LINE__);
    exit(1);
  }

  memcpy(&__str->str[strlen_s], __char, strlen_char);

  __str->str[total] = '\0';

  __str->length = total + 1;

  if (__str->length <= strlen_s) {
    fprintf(stderr,
            ANSI_COLOR_RED
            "[ERROR]: the lenght of the new String didn't change at "
            "[Str_cat(),libstr.c:%d]\n" ANSI_COLOR_RESET,
            __LINE__);
    printf("lenght= %lu\n", __str->length);
  }
}




// variadic function Not For Use 
// Insted use The Macro Str_cat_list

void Str_cat_list_fn(String *__str, ...) {
 
    va_list va;
    va_start(va, __str);
    const char *trps = va_arg(va,const char*);
    int len=0;
    while (trps != NULL) {
        len += strlen(trps);
        trps = va_arg(va,const char*);
    }
    va_end(va);

   
     va_list args;
     va_start(args, __str);
     const char *arg = va_arg(args, const char *);
    
     char* ptr = calloc(len+1, sizeof(char));
        
     while (arg != NULL) {
    strcat(ptr, arg);
    arg = va_arg(args, const char *);
  }
   // printf("%s\n",ptr);
    Str_cat_m(__str, ptr);
    free(ptr);
    va_end(args);

}


//void Str_cat_list_fn(String *__str, ...) {
// 
//    va_list va;
//    va_start(va, __str);
//     char *trps = va_arg(va, char*);
//    int len=0;
//    while (trps != NULL) {
//        len += strlen(trps);
//        trps = va_arg(va, char*);
//    
//    va_end(va);
//
//   
//     va_list args;
//     va_start(args, __str);
//    char *arg = va_arg(args,  char *);
//    
//     char* ptr = calloc(len+1, sizeof(char));
//     while (arg != NULL) {
//       strcat(ptr, arg);
//       arg = va_arg(args,  char *);
//  }
//  //  add_strptr_stack(ptr);
//    printf("%s\n",ptr);
// //   Str_cat(__str, ptr);
//    char* optr = __str->str;
//    __str->str = realloc(__str->str,(__str->length + len +10));
//    strcat(__str->str, ptr);
//    update_ptr_pointer(optr, __str->str);
//  // free(ptr);
//    va_end(args);
//}
//
//}



void Str_push(String *__str, char c) {

  if (__str->str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED "[ERROR]:using a freed String at" ANSI_COLOR_MAGENTA
                           " [ %s:%d , %s()]\n" ANSI_COLOR_RESET,
            __FILE__, __LINE__, __func__);
    exit(1);
  }
  //

  size_t strlen_s = __str->length ;
  size_t strlen_char = 1;
  size_t total = strlen_s + strlen_char;

  char *old_ptr = __str->str;
  __str->str = realloc(__str->str, (total + 1) * sizeof(char));
  update_ptr_pointer(old_ptr, __str->str);

  if (__str->str == NULL) {
    fprintf(stderr,
            ANSI_COLOR_RED "[ERROR]: failed to reallocarray at "
                           "[Str_cat(),libstr.c:%d]\n" ANSI_COLOR_RESET,
            __LINE__);
    exit(1);
  }

  // memcpy(&__str->str[strlen_s], __char, strlen_char);
  __str->str[strlen_s] = c;
  __str->str[total] = '\0';

  __str->length = total + 1;

  if (__str->length <= strlen_s) {
    fprintf(stderr,
            ANSI_COLOR_RED
            "[ERROR]: the lenght of the new String didn't change at "
            "[Str_cat(),libstr.c:%d]\n" ANSI_COLOR_RESET,
            __LINE__);
    printf("lenght= %lu\n", __str->length);
  }
}

void Str_input(String *buf) {
  buf->str = NULL;
  buf->length = 0;
  int c = fgetc(stdin);
  buf->str = malloc(25 * sizeof(char));
  char *old_ptr = buf->str;
  int i = 0;
  int siz = 25;

  while (c != '\n' && i < siz) {
    if (i == siz - 1) {
      buf->str = realloc(buf->str, (siz + 20) * sizeof(char));
      // memset(&buf->str[siz], 0, 20 * sizeof(char));
      char *_new = buf->str;
      siz = siz + 20;
      update_ptr_pointer(old_ptr, _new);
    }
    buf->str[i] = c;
    c = fgetc(stdin);
    i++;
  }

  char *fin_ptr = buf->str;
  buf->length = siz;
  add_strptr_stack(fin_ptr);
}



// gives you  a new string without the substracted chars 
String Str_substr(String s, size_t st_pos, size_t n) {
  String __strl = {0,0,NULL};

  for (int i = 0; i < (int)s.length; i++) {
    if (i == (int)st_pos) {
      __strl = StringBuild_s(&s.str[st_pos], n);
    }
  }
  return __strl;
}

//////////////////////////////////////////////////////||||
//////////////////////////////////////////////////////////////////////|||||

void printINT(int x) { printf("%i\n", x); }

void printFLOAT(float x) { printf("%f\n", x); }
void printDOUBLE(int x) { printf("%d\n", x); }

void printU_INT(unsigned int x) { printf("%u\n", x); }

void printSize_t(size_t x) { printf("%lu\n", x); }

void printString(String x) {
  if (check_marked_free(x)) {
    printf(ANSI_COLOR_YELLOW "[ERROR]: unaccessable String , has been freed "
                             "before.\n" ANSI_COLOR_RESET);
    return;
  }
  printf("%s\n", x.str);
}
void printCHAR(char x) { printf("%c\n", x); }
void printLIST(list x) {
  putchar('{');
  for (int i = 0; i < (int)x.length; ++i) {
    if (i == (int)(x.length - 1)) {
      printf("\"%s\" ",(char*) x.ptr[i]);
    } else {
      printf("\"%s\", ",(char*) x.ptr[i]);
    }
  }
  puts("}");
}
void printSTRLIST(Str_list x);

void printCHAR_PTR(char *x) {
  if (check_marked_free_ptr(x)) {
    printf(ANSI_COLOR_YELLOW "[ERROR]: unaccessable String , has been freed "
                             "before.\n" ANSI_COLOR_RESET);
    return;
  }

  printf("%s\n", x);
}

void printINT_PTR(int *x) { printf("%p\n", (void *)x); }
void printDEFAULT() {
  printf(ANSI_COLOR_YELLOW "[ERROR]: UnKnown data type\n" ANSI_COLOR_RESET);
}
