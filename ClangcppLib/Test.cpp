#include "LibStr.hpp"
#include "LibTypes.hpp"
#include "file_handle.hpp"
#include "error_out.h"
#include <stddef.h>
#include <stdio.h>
#include <string>
#include <time.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <type_traits>
#include <typeinfo>
#ifndef _MSC_VER
#   include <cxxabi.h>
#endif
#include <memory>
#include <string>
#include <cstdlib>



template <class T>
std::string
type_name()
{
    typedef typename std::remove_reference<T>::type TR;
    std::unique_ptr<char, void(*)(void*)> own
           (
#ifndef _MSC_VER
                abi::__cxa_demangle(typeid(TR).name(), nullptr,
                                           nullptr, nullptr),
#else
                nullptr,
#endif
                std::free
           );
    std::string r = own != nullptr ? own.get() : typeid(TR).name();
    if (std::is_const<TR>::value)
        r += " const";
    if (std::is_volatile<TR>::value)
        r += " volatile";
    if (std::is_lvalue_reference<T>::value)
        r += "&";
    else if (std::is_rvalue_reference<T>::value)
        r += "&&";
    return r;
}
int main(){
       
    long t1 = clock();

    File af;  //= read_file_to_string("./LibStr.cpp");
 //   a.open("./LibStr.hpp", "r+");
    //String  s =  a.read_to_string();
   // Println(s);
    List<char*> alis = Str_split(af.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
    
    Println(alis);
   // free_str(a.buf);

    Str_free_all();

    af.close();
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

      
    Str_cat_List(&news, " 555", ":9000", ":1213",":14sw2");
  
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


   String say = StringBuild("Say {b} {i} {s} {d}");

    List<String> var  =  fmt::Parse(say);

    for (usize i=0; i < var.length;++i) {
        Println(var[i]);
    }

//    std::vector<int> s;

    int a[] ={1,2,3,4,5,6};
    List<int> vec;
    vec.push_back(a[0]);
    vec.push_back(a[1]);
    vec.push_back(a[2]);
    vec.push_back(a[3]);
    vec.push_back(a[4]);

    for(int j= 0; j < (int) vec.length;++j)
    {
        printf("%i\n",vec.ptr[j]);
    }


    std::string sa = type_name<decltype(vec)>() ;
    puts("\n");
    std::cout << sa << '\n';


    
  Str_free_all();
}


