// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

class WWDCGreeting {
  let who: String
  
  init(who: String) {
    self.who = who
  }
  
  deinit {
    print("\(who) went away")
  }
  
  lazy var greetingMaker: () -> String = { [weak self] in
    guard let self = self else {
      return "No greeting"
    }
    return "Hello \(self.who)."
  }
}

do {
  let mermaid = WWDCGreeting(who: "caffinated mermaid who helped me with this course")
  print(mermaid.greetingMaker())
}
