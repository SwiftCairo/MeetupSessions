// “Depend on abstractions, not on concretions”

//protocol NetworkServicing {
//  func callAPI()
//}

class Alamofire {
//class Alamofire: NetworkServicing {
  func callAPI() {}
}

class AnotherNetworking {
//class AnotherNetworking: NetworkServicing {
  func triggerAPICall() {}

//  func callAPI() {
//    triggerAPICall()
//  }
}

class ViewModel {
  private let alamofire = Alamofire()
//  private let networkServicing: NetworkServicing = AnotherNetworking()

  func buttonTapped() {
    alamofire.callAPI()
  }
}


// Follows DIP
