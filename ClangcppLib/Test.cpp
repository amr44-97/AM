#include "LibStr.hpp"
#include "LibTypes.hpp"
#include "file_handle.hpp"
#include "error_out.h"
#include <stddef.h>
#include <stdio.h>
#include <time.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>


int main(){
       
    long t1 = clock();

    File a;  //= read_file_to_string("./LibStr.cpp");
 //   a.open("./LibStr.hpp", "r+");
    //String  s =  a.read_to_string();
   // Println(s);
    list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
    
    Println(alis);
   // free_str(a.buf);

    Str_free_all();

    a.close();
    long t2 = clock();

    double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
    Println("==============================================================");
    Println("==============================================================");
    Println("==============================================================");
    printf("Total time Taken is %0.12f\n",(double) tot);



    String news = StringBuild("Hello World Iam amr ");
    Println(news);

    Str_cat(&news,"Abdellah Mohammed Maharek!!");
    Println(news);

      
    Str_cat_list(&news, " 555", ":9000", ":1213",":14sw2");
  
    Println(news);


    String kat = StringBuild(ANSI_COLOR_MAGENTA "Hello Iam kat");
    Println(kat);
    
    kat += " Assembly";
    
    Println(kat);
  
    String s = kat + " Hello ALL Of you";
    Println(s);
    
    s = s + kat + " Hello ALL Of you";
    Println(s);
    s = s + kat + " Hello ALL Of you";
    Println(s);
    
    Println(kat);

    




  Str_free_all();

}


