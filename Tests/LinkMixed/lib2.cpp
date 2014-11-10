#include "lib2.h"

#include <lib1.h>
#include <iostream>

void lib2::L2::bar()
{
    lib1::L1 l1;
    l1.foo();
    std::cout << "lib2::L2::bar()" << std::endl;
}
