#include <cstdio>
#include <vector>
#include <string>
#include <boost/algorithm/string.hpp>
#include <iostream>
#include <fstream>

int main()
{
    std::ifstream t("../libstr.c");
    t.seekg(0, std::ios::end);
    size_t size = t.tellg();
    std::string buffer(size, ' ');
    t.seekg(0);
    t.read(&buffer[0], size);

   const std::string s = "hello and what";
   std::vector<std::string> v;
   boost::split(v, buffer, [](char c) { return c == ' '; }, boost::token_compress_on);
   for (const auto& str : v)
   {
      std::cout << str << std::endl;
   }
    int x=0;
    for(int i=0; i < size;i++){
        if(buffer[i] == ' ')x++;
    }
    std::cout << "token_num = " << x << '\n';
}
