// Copyright (c) 2018 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

open class CelestialBody {
  
  public var name: String
  
  public init(_ name: String) {
    self.name = name
    print("🐣 init   \(name)")
  }
  
  deinit {
    print("☠️ deinit \(name)")
  }
}
