// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.


/* HINT: use a class like this! ;]
final class Unowned<T: AnyObject> {
  unowned let value: T
  init (_ value: T) {
    self.value = value
  }
}
*/

class Person {
  var name: String
  var friends: [Person] = []
  init(name: String) {
    self.name = name
    print("Hello: \(name)")
  }
  
  deinit {
    print("Goodbye \(name)")
  }
}

do {
  let ray = Person(name: "Ray")
  let vicki = Person(name: "Vicki")
  let greg = Person(name: "Greg")
  let tammy = Person(name: "Tammy")
  let darren = Person(name: "Darren")
  let richard = Person(name: "Richard")
  
  ray.friends.append(contentsOf: [vicki,tammy,
                                  richard,greg,
                                  darren])
  vicki.friends.append(contentsOf: [ray,tammy,
                                    richard,greg,
                                    darren])
}



