#include "bar.h"

#include <foo.h>
#include <stdio.h>

void bar()
{
    foo();
    printf("bar()\n");
}
