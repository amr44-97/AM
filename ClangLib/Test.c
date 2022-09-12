#include "LibStr.h"
#include "file_handle.h"
#include <stddef.h>
#include <stdio.h>
#include <time.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>


int main(){
       
    long t1 = clock();

    file a = read_file_to_string("./text_file.txt");

    list alis = Str_split(a.buf); //Str_split(a.buf);
    
 //   String p = a.buf;

    Println(alis);
    Println(a.buf);
 

    Str_cat(&a.buf, " Assembly");
    //Println(a.buf);
    Println(a.buf);



    close_file(a);
  
    //  free(alis.ptr);
    

  /*
   *  How to deal with double free
   *  Freed_Ptrs[]
   *
   *    new str
   *    check_new_ptr() => if In_Freed_Ptrs => remove_Ptr
   *    
   *    else{
   *    do_nothing()
   *    }
   *    new List 
   *
   * */

    Str_free_all();

//    long t2 = clock();
//
//    double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
//    Println("==============================================================");
//    Println("==============================================================");
//    Println("==============================================================");
//    printf("Total time Taken is %0.12f\n",(double) tot);
//
//
//
//    String new = StringBuild("Hello World Iam amr ");
//    Println(new);
//
//   // Str_cat(&new,"Abdellah Mohammed Maharek!!");
//    Println(new);
//
//      
// //   Str_cat_list(&new, " 555", ":9000", ":1213",":14sw2");
//  
//    Println(new);
//
//
//  Str_free_all();

}


