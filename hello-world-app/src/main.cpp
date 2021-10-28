//
// Created by Evgenii.Novozhilov on 18.10.2021.
//

#include <hellolib/hellolib.h>
#include <worldlib/worldlib.h>

#include <iostream>

int main() {
    std::cout << hello::get() << " " << world::get() << std::endl;
}