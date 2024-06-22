// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

var value = 0

let show = {
  print(value)
}

show()  // 0
value = 10
show()  // 10

let show2 = { [value] in
  print(value)
}

value = 11

show2()  // 10
value = 20
show2()  // 10

value = 30

let show3 = { [v = value, b = value+1] in
  print(v,b)
}

show3()  // 30 31
value = 40
show3()  // 30 31

class Cat {
  func speak() { print("meow" )}
}

var play: () -> Void = {}

do {
  let whiskers = Cat()

  play = { [weak cat = whiskers] in
    guard let cat = cat else {
      print("no playing")
      return
    }
    cat.speak()
  }
  
  play()
}

play()
