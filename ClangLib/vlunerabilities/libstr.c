#include "libstr.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/cdefs.h>
#include <unistd.h>


#define __STRING_STACK_SIZE 20000
#define MIN_LIST 500

// a container to all the allocatoins 

static void* __STRING_STACK[__STRING_STACK_SIZE] = {NULL};
static void* __MARKED_FREE[__STRING_STACK_SIZE] = {NULL};


static string __str_copy(string __str);
static list __str_split(char *old_list);
static inline void add_strptr_stack(void *__str);
static inline int  check_marked_free(string __str);

// counter to the allocations
unsigned int __stack_pos = 0;
// counter to freed memory
unsigned int __Marked_Free_POS = 0;

static inline void add_strptr_stack(void *__str){
        __STRING_STACK[__stack_pos] = __str;
        __stack_pos++;
}

void __str_free_all(){
    for(int i =0 ; i <=  (int)__stack_pos;i++){
        __MARKED_FREE[__Marked_Free_POS] = __STRING_STACK[i];
        free(__STRING_STACK[i]);
        __STRING_STACK[i] = NULL;
        __Marked_Free_POS++;
    }
    __stack_pos = 0;
}

string newstr(char *__str){
    const unsigned int len = strlen(__str);
//[NOTE]  undefined behavior with non-null terminated strings
//[NOTE]    // TODO fix undefined behavior
    string __local = {.str = (char*) calloc(len+1,sizeof(char)),
                      .length = len,
                      .find = &__str_find_char,
                      .copy = &__str_copy,
                      .split = &__str_split
    } ;
//[NOTE]   // Valgrind gives error when copying to not enough space
        memccpy(__local.str, __str,'\0', len);
        add_strptr_stack(__local.str);
        return __local;
}

static inline int  check_marked_free(string __str){
    int no_err = 0;
    if(__Marked_Free_POS > 0){ 
        for( int i =0; i < (int)__Marked_Free_POS;i++)
          {
            if(__str.str == __MARKED_FREE[i]){
                 //fprintf(stderr, "[ERROR:] %s",__error_type);
                 no_err = 1;  
            }
        }
    }
    return no_err;
}


static string __str_copy(string __str){
    
    if(__str.str == NULL) {
        fprintf(stderr,"[ERROR:] copying from empty [NULL] string\n");
        exit(-1);
    }
    if(check_marked_free(__str)){
       fprintf(stderr, "[ERROR:] copying from unaccessable string\n");
        exit(-1);
    }
    const unsigned int len= __str.length ;
    string __local = {.str = (char*) calloc(len+1,sizeof(char)),
                      .length = len} ;  
      
        memccpy(__local.str, __str.str,'\0', len);
        
        add_strptr_stack(__local.str);
        return __local;
}


void __str_println(string __str){
 __attribute_maybe_unused__ int s= write(1, __str.str, __str.length);
__attribute_maybe_unused__ int sa= write(1,"\n", 1);
}

void __str_print(string __str){
 __attribute_maybe_unused__ int s= write(1, __str.str, __str.length);
}


_pos __str_find_char(string __str, char element){
    _pos __curr_pos = 0;
    for(int i =0 ; i< (int) __str.length;i++){
        if(__str.str[i] == element){__curr_pos = i;break;}
    }
    return __curr_pos;
}



// TODO allow split to take array of delimeters
//static int ret_delim(char *__str,const char delim[]){
//    int ret =0 ;
//    for(int i = 0 ; i < sizeof(*delim);i++){
//       for(int x =0 ; x < sizeof(*__str);x++){
//           if (delim[i] == __str[x]){
//            ret =1;
//           }
//        
//        }
//    }
//    return ret;
//}


static list __str_split(char *old_list) {
  list new_list ={.ptr = calloc(MIN_LIST, sizeof(char*)) ,
                 .length = 0
  };

  add_strptr_stack(new_list.ptr);
  //char **new_list = calloc(MIN_LIST, sizeof(char*))  ;
  char *ptr_listclone;
  ptr_listclone = &old_list[0];
  new_list.ptr[0] = ptr_listclone;
  int i = 0,x =0 ;
  
  while (old_list[i] != '\0') {
    if (old_list[i] == ' ' || old_list[i] == '\n' || old_list[i] == ',') {
      old_list[i] = '\0';
      ptr_listclone = &old_list[i + 1];
      new_list.ptr[x+1] = ptr_listclone;
      x++;
    }
    i++;
  }
     new_list.length = x+1;
    return new_list;
}

void __str_check_error(string __str){
    if(__str.str == NULL || __str.length == 0){
        fprintf(stderr,"[ERROR]: unaccessable OR empty string\n");
        exit(-1);
    }
}

void __char_check_error(char* __str){
    if(__str == NULL ){
        fprintf(stderr,"[ERROR]: unaccessable OR empty char ptr\n");
        exit(-1);
    }
}


void __str_cat(string __str ,char * __char){
    __str_check_error(__str);
    __char_check_error(__char);
    size_t __len = strlen(__char)+1;
    __str.str = realloc(__str.str,(__str.length + __len)*sizeof(char));
    char *ppt = &__str.str[__str.length];
    memcpy(ppt, __char, __len);
}




