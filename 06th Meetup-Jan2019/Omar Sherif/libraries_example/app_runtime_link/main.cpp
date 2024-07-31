#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <thread>

int main(int argc, char **argv)
{
    while (1)
    {
        void *handle;
        int (*dynamic_add)(int, int);
        char *error;
        handle = dlopen("../dynamic/libidea_dynamic.so", RTLD_LAZY);
        if (!handle)
        {
            fprintf(stderr, "%s\n", dlerror());
            exit(1);
        }
        dlerror();
        *(void **)(&dynamic_add) = dlsym(handle, "dynamic_add");
        if ((error = dlerror()) != NULL)
        {
            fprintf(stderr, "%s\n", error);
            exit(1);
        }
        printf("%i\n", (*dynamic_add)(10, 20));
        dlclose(handle);
        std::this_thread::sleep_for(std::chrono::seconds(3));
    }
    return 0;
}