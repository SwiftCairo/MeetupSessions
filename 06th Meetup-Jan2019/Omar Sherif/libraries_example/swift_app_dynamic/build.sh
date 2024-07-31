rm -rf ./swiftCode
/home/$USER/Clones/swift-4.2.1/usr/bin/swiftc -import-objc-header \
../dynamic/include/dynamic/idea.h \
main.swift \
-o swiftCode \
-L$(pwd)/../build/dynamic -lidea_dynamic

export LD_LIBRARY_PATH=$(pwd)/../build/dynamic/
./swiftCode

# nm -D $(pwd)/../build/dynamic/libidea_dynamic.so