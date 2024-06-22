// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

final class Unowned<T: AnyObject> {
  unowned let value: T
  init (_ value: T) {
    self.value = value
  }
}

class Person {
  var name: String
  var friends: [Unowned<Person>] = []
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
  
  ray.friends.append(contentsOf: [Unowned(vicki),Unowned(tammy),
                                  Unowned(richard),Unowned(greg),
                                  Unowned(darren)])
  vicki.friends.append(contentsOf: [Unowned(ray),Unowned(tammy),
                                    Unowned(richard),Unowned(greg),
                                    Unowned(darren)])
}


