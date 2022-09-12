#ifndef F_HANDLER
#define F_HANDLER 
#include "LibStr.h"
#include<stdio.h>


typedef struct file{
    const char *name;
    size_t size;
    FILE *ptr;
    String buf; // replaced with string from  libstr.h
}file;

file open_file(const char *file_name,const char *flag);
file read_file_to_string(const char *file_name);
void copy_file_to(const char *src, const char *dest);
void close_file(file fl);

#endif

