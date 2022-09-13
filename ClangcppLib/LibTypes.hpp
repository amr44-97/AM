#ifndef AM_LIBTYPES_H
#define AM_LIBTYPES_H

#include <stdlib.h>
#include <string.h>
#include <string>
#include <stdint.h>
#include <stddef.h>
#include <typeinfo>

#define null NULL


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

struct String;
//typedef struct List List;

#include<vector>

template<typename T>
struct List;





struct String {
   size_t length;
   size_t capacity;
   char*  str;

// made from scratch and uses memcpy

    public:  
    void    cat_m(const char * __char);
    void    cat(const char * __char); 
    String  cat_to_new(const char * __char); 
    List<char*>    split(String strc);
    List<char*>   split_by_delim(char *strc,const char delimeter[]);
    String  substr(size_t st_pos, size_t n);
 //  int     find_char(String __str, char element);
 //   int     find_char(const char* __str, char element);
    int     find_char(char element);
    int     find_char(size_t cur_index,char element);

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



template<typename T>
struct List {
    public:
    T* ptr  = nullptr;
    size_t length   = 0;
    size_t capacity = 0;
    

    void push_back(T element){
        size_t len = this->length;
        this->extend(1);
        this->ptr[len] = element;
        this->length+=1;
    }

    void pop_back(){
        size_t len = this->length;
       // this->extend(1);
        this->ptr[len] = nullptr;
        this->length-=1;
    }

    
    char* operator[](int i){
            if(typeid(String) == typeid(T)){
                    return this->ptr[i].str;
            }
    }

    private:
    void extend(size_t num){
        this->ptr = (T*)realloc(this->ptr, ((num+ this->capacity) * sizeof(T)) );
        this->capacity += num;
    }

};


namespace fmt{
    List<String> Parse(String fmt);

};
// length of List is the number of elements


#endif // AM_LIBTYPES_H
