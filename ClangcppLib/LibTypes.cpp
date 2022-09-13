#include "LibTypes.hpp"
#include <cstdlib>
#include <stdio.h>
#include <string.h>
#include <string>
#include <vector>
struct fmt_format{
    int num_args=0;
    String str;
};

static void Println(List<char*> x) {
    puts("{");
  for (int i = 0; i < (int)x.length; ++i) {
    if (i == (int)(x.length - 1)) {
      printf("\"%s\" ",(char*) x.ptr[i]);
    } else {
      printf("\"%s\", ",(char*) x.ptr[i]);
    }
  }
    puts("}");
}




namespace fmt{
    List<String> Parse(String fmt){
        usize fmt_s  = fmt.length;
        String substr;
        int fnum=0;
        List<String> vec;
        for(usize i=0; i <  fmt_s;++i){
                if(fmt.str[i] == '{')
                {
                    std::string s;
                    substr = fmt.substr(i,(fmt.find_char(i,'}')+1) -i );
                    fnum++;
                    vec.push_back(substr);
                    printf("substr = %s\n", substr.str);
                }
        }
      //      for(int i=0; i < (int)vec.length;++i){
      //          printf("%s\n",vec[i]);
      //      }    

        return vec;
   }


};






