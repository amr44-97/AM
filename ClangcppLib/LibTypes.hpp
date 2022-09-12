#ifndef AM_LIBTYPES_H
#define AM_LIBTYPES_H


#include <cstring>
#include <stdint.h>
#include <stddef.h>

#define null NULL
#define nullptr  NULL


typedef uint8_t                u8;
typedef int8_t                 i8;

typedef uint16_t               u16;
typedef int16_t                i16;

typedef uint32_t               u32;
typedef int32_t                i32;

typedef uint64_t               u64;
typedef int64_t                i64;
typedef size_t                 usize;




typedef unsigned char* cstr;

typedef struct String String;
typedef struct list list;




struct String {
   size_t length;
   size_t capacity;
   char*  str;

// made from scratch and uses memcpy

    public:  
    void    cat_m(const char * __char);
    void    cat(const char * __char); 
    String  cat_to_new(const char * __char); 
    list    split(String strc);
    list    split_by_delim(char *strc,const char delimeter[]);
    String  substr(String s, size_t st_pos, size_t n);
    int     find_char(String __str, char element);
    int     find_char(const char* __str, char element);

    private:
// uses strcat 

    String  Build (const char *__str); 
    String  Build_s(const char *__str, size_t size);


    public:
    void operator +=(const char* s){
                this->cat(s);
        }
    void operator +=(String s){
                this->cat(s.str);
        }

    
    String operator+(const char* s){
           return cat_to_new(s);
    }
    
    String operator+(String s){
           return cat_to_new(s.str);
    }


};

// length of list is the number of elements
struct list {
    char** ptr;
    size_t length;
};



#endif // AM_LIBTYPES_H
