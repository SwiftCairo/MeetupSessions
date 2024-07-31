
class Alamofire {
  func callAPI() {}
}

class AnotherService {
  func triggerAPICall() {}
}

class ViewModel {
  private let alamofire = Alamofire()

  func buttonTapped() {
    alamofire.callAPI()
  }
}




//---------------------------------------




// What is a dependency?
// Where is it?

// How to replace it dynamically upon certain condition?

