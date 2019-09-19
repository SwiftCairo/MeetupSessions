//
//  Created by Omar Sherif Fathy on 8/26/19.
//  Copyright © 2019 Omar Sherif Fathy. All rights reserved.
//

import Foundation

class Person {
    var age: UInt8
    var weight: UInt8
    var height: UInt8
    
    init() {
        age = 1
        weight = 1
        height = 1
    }
}

class Car {
    var model: UInt8
    var weight: UInt8
    var height: UInt8
    
    init() {
        model = 1
        weight = 1
        height = 1
    }
}

class PersonSubset {
    var whatever: UInt8
    var whatever1: UInt8
    var val: UInt8
    
    init() {
        whatever = 0
        whatever1 = 0
        val = 1
        
    }
}

func takePerson(ptr: UnsafeMutableRawPointer)
{
    let pp = ptr.load(as: Person.self)
    print("person's age: \(pp.age)")
}

func takeCar(ptr: UnsafeMutableRawPointer)
{
    let pp = ptr.load(as: Car.self)
    print("car model: \(pp.model)")
}

func takeSubset(ptr: UnsafeMutableRawPointer)
{
    let pp = ptr.load(as: PersonSubset.self)
    print("subset val: \(pp.val)")
}

func main() {
    var omar: Person = Person()
    var nada: Person = Person()
    
    let count = 1
    let stride = MemoryLayout<Person>.stride
    let alignment = MemoryLayout<Person>.alignment
    let byteCount = alignment * count
    
    print("Count: \(count)\nStride: \(stride)\nAlignment: \(alignment)\nByteCount: \(byteCount)")
    // Person*
    var ptr = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
    // before we leave the scope don't forget to release mem
    defer {
        ptr.deallocate()
    }
    
    // now lets bind the ptr to some value
    ptr.storeBytes(of: omar, as: Person.self)
    omar.age = 3
    omar.weight = 5
    omar.height = 7
    takePerson(ptr: ptr)
    takeCar(ptr: ptr)
    takeSubset(ptr: ptr)
}

main()
print("\nDone!")


