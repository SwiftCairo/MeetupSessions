llvm-extract -func=swift_add ../swift_example/swift_example.ll -o swift_example.ll
llvm-extract -func=rust_add ../rust_example/rust_example.ll -o rust_example.ll

llvm-link ../cpp_example/cpp_example.ll swift_example.ll rust_example.ll -f > all_example
chmod u+x all_example
./all_example