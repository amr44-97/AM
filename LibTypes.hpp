#ifndef AM_LIBTYPES_H
#define AM_LIBTYPES_H


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


typedef unsigned char* cstr;

typedef struct String String;
typedef struct list list;




struct String {
   size_t length;
   size_t capacity;
   char*  str;
};

// length of list is the number of elements
struct list {
    char** ptr;
    size_t length;
};



#endif // AM_LIBTYPES_H
