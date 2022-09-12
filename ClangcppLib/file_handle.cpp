#include "file_handle.hpp"
#include "error_out.h"
#include "LibStr.hpp"
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/cdefs.h>
#include <assert.h>



// return a File description
void File::open(const char *file_name,const char *flag)
{
 //   auto self = this->ptr;
 //   auto _size = this->size;
    this->ptr =  fopen(file_name, flag);
    if(this->ptr == nullptr){
        fprintf(stderr,ANSI_COLOR_RED "[ERROR]: Failed to open the file [%s:%i] \n" ANSI_COLOR_RESET,__func__,__LINE__);
        exit(-1);
    }
    fseek(this->ptr,0,SEEK_END);
         this->size  = ftell(this->ptr);
    fseek(this->ptr,0,SEEK_SET);
    this->name = file_name;
    this->opened = 1;
}

//File::~File()
//{
//    fclose(this->ptr);
//    this->ptr = nullptr;
//    this->opened = 0;
//    this->size   = 0;
//    this->name   = nullptr; 
//}




void File::close(){
    fclose(this->ptr);
}


String File::read_to_string(){
    if(this->opened != 1){ 
     fprintf(stderr,ANSI_COLOR_RED "[ERROR]: Copying from empty file            [Open file first] [%s:%i] \n" ANSI_COLOR_RESET,__func__,__LINE__);
       exit(1);
    }
 //   char *__dest = nullptr;
   
   auto size  =  this->size;
 //   auto self  =  this->ptr;
    const char* __dest = (char *) malloc((size+1) *sizeof(char));
    memset((char*)__dest,0,size+1);
    (void) fread((char*)__dest,1,size+1,this->ptr);
    this->buf = StringBuild(__dest);
    free((char*)__dest);
    return this->buf;
    
}


String File::read_to_string(const char * file_name){
         this->open(file_name, "r+");
         return  this->read_to_string();
}



void File::copy_to(const char *dest){
  //:  auto self = this;
    if(this->opened != 1){
        fprintf(stderr,ANSI_COLOR_RED "[ERROR]: Copying from empty file            [Open file first] [%s:%i] \n" ANSI_COLOR_RESET,__func__,__LINE__);
        exit(1);
    }
   // auto src = this->name;
    char * tmp = NULL;
    FILE *File_ = this->ptr;
   
    if(File_ == NULL){
        fprintf(stderr,ANSI_COLOR_RED "[ERROR]: UnKnown File [%s:%i] \n" ANSI_COLOR_RESET,__func__,__LINE__);
        exit(-1);
    }
    tmp = (char *) malloc((this->size) *sizeof(char));
    
    (void) fread(tmp,1,this->size,File_);
    
    FILE *fpdest = fopen(dest,"wb+");
    (void) fwrite(tmp, 1,this->size, fpdest);
    fclose(fpdest);
    fclose(File_);
    free(tmp);
}


