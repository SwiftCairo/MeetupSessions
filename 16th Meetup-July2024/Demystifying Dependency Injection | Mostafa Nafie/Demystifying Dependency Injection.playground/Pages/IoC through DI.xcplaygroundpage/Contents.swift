
// Move all the responsibilities of a class, except its main one, outside, making them its dependencies.

// Invert the control of dependencies creation.
// ViewModel no longer controls the creation of Alamofire


class Alamofire {
  func callAPI() {}
}

class ViewModel {
  let alamofire = Alamofire()

  func buttonTapped() {
    alamofire.callAPI()
  }
}

// How?

//class ViewModel {
//  var alamofire: Alamofire
//
//  init(alamofire: Alamofire) {
//    self.alamofire = alamofire
//  }
//
//  func buttonTapped() {
//    alamofire.callAPI()
//  }
//}

//let alamofire = Alamofire()
//let viewModel = ViewModel(alamofire: alamofire) // DI Constructor Injection
//viewModel.alamofire = alamofire // DI Property injection
