//
// Created by Evgenii.Novozhilov on 18.10.2021.
//

#ifndef HELLOLIB_HELLOLIB_H
#define HELLOLIB_HELLOLIB_H

#include <string>

inline constexpr std::string_view HELLO = "hello";

namespace hello {
    std::string get();
}

#endif //HELLOLIB_HELLOLIB_H
