#include "file_handle.h"
#include "error_out.h"
#include "LibStr.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/cdefs.h>
#include <assert.h>

// return a file description
file open_file(const char *file_name,const char *flag)
{
    file sr = {0,
        0,
        NULL,
        {.length =0, .str=NULL}
    };
    FILE *file_ = fopen(file_name,flag);
    assert(file_ != NULL);   
    fseek(file_,0,SEEK_END);
    size_t file_size = ftell(file_);
    
    //assert(file_size > 0);
    sr.size = file_size;
    fseek(file_,0,SEEK_SET);
    sr.ptr = file_;
    sr.name = file_name;
    return sr;
}

void close_file(file fl){
    fclose(fl.ptr);
}

file read_file_to_string(const char *file_name){
    
    char *__dest = NULL;
    
    file __local = {NULL
        ,0
        ,NULL
        ,{.length=0,.str=NULL} };//{file_name,0,NULL,NULL};
    
    __local.name = file_name;
    FILE *file_ = fopen(file_name,"r+");
   
    __local.ptr = file_;
 //   if(file_ == NULL){
 //       fprintf(stderr,ANSI_COLOR_RED "[ERROR]: UnKnown file [%s:%i] \n" ANSI_COLOR_RESET,__func__,__LINE__);
 //       exit(-1);
 //   }
    fseek(file_,0,SEEK_END);
    size_t file_size = ftell(file_);
  //  assert(file_size > 0);
    fseek(file_,0,SEEK_SET);
    __local.size = file_size;
    __dest = (char *) malloc((file_size+1) *sizeof(char));
    memset(__dest,0,file_size+1);
    (void) fread(__dest,1,file_size+1,file_);
    __local.buf = StringBuild(__dest);
    free(__dest);
    return __local;
}


void copy_file_to(const char *src, const char *dest){
    
    char *__dest = NULL;
    
    FILE *file_ = fopen(src,"rb+");
   
    if(file_ == NULL){
        fprintf(stderr,ANSI_COLOR_RED "[ERROR]: UnKnown file [%s:%i] \n" ANSI_COLOR_RESET,__func__,__LINE__);
        exit(-1);
    }
    fseek(file_,0,SEEK_END);
    size_t file_size = ftell(file_);
    assert(file_size > 0);
    fseek(file_,0,SEEK_SET);

    __dest = (char *) malloc((file_size) *sizeof(char));
    
    (void) fread(__dest,1,file_size,file_);
    
    FILE *fpdest = fopen(dest,"wb+");
    (void) fwrite(__dest, 1,file_size , fpdest);
    fclose(fpdest);
    fclose(file_);
    free(__dest);
}


