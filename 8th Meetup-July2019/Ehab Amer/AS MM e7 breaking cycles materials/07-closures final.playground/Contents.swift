// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class Supernova: CelestialBody {
  lazy var explode: () -> Void = { [unowned self]  in
    self.name = "BOOMED \(self.name)"
  }
}

do {
  let tycho = Supernova("Tycho")
  tycho.explode()
  print(tycho.name)
}

do {
  let kepler = Supernova("Kepler")
  DispatchQueue.global().asyncAfter(deadline: .now() + 0.1 ) {
    kepler.explode()
    print(kepler.name)
  }
}

//do {
//  let galileo = Supernova("Galileo")
//  DispatchQueue.global().asyncAfter(deadline: .now() + 0.1 ) { [unowned galileo] in
//    galileo.explode()
//    print(galileo.name)
//  }
//}

do {
  let galileo = Supernova("Galileo")
  DispatchQueue.global().asyncAfter(deadline: .now() + 0.1 ) { [weak galileo] in
    guard let galileo = galileo else {
      print("Nada")
      return
    }
    galileo.explode()
    print(galileo.name)
  }
}
