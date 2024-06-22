let x : Int = 1
struct Person {
    var age: UInt32 = 1
    var weight: Double = 187.3
    var isMale: Bool = true
}
print("Double takes \(MemoryLayout<Double>.size) bytes")
print("UInt32 takes \(MemoryLayout<UInt32>.size) bytes")
print("Bool takes \(MemoryLayout<Bool>.size) bytes")

print(MemoryLayout<Person>.size)
print(MemoryLayout<Person>.stride)
print(MemoryLayout<Person>.alignment)