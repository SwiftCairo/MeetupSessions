#include <stdio.h>

extern "C" int cpp_add(int a, int b) { return a + b; }
extern "C" int swift_add(int a, int b);
extern "C" int rust_add(int a, int b);

int main(int argc, char **argv)
{
    printf("cpp_add(1, 2) = %i\n", cpp_add(1, 2));
    printf("swift_add(10, 20) = %i\n", swift_add(10, 20));
    printf("rust_add(100, 200) = %i\n", rust_add(100, 200));
    return 0;
}