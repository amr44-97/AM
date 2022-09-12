#include <iostream>
#include <string>
#include <ranges>
#include <string_view>



int main(){



    std::string sd = "hello people How are you iam groot ---- random stuff --asdad adadf sdoihy tgui hoj uya fdu kali dua ;a hoi ;fga" ;

    auto split = sd
        | std::ranges::views::split(' ')
        | std::ranges::views::transform([](auto&& str) { return std::string_view(&*str.begin(), std::ranges::distance(str)); });

    for (auto&& word : split)
    {
        std::cout << word << std::endl;
    }


}

