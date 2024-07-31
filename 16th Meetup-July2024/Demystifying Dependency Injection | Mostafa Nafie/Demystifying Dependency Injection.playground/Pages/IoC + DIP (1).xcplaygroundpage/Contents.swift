
protocol NetworkServicing {
  func callAPI()
}

class Alamofire: NetworkServicing {
  func callAPI() {}
}

class ViewModel {
  private let networkService: NetworkServicing // DIP using Abstraction

  init(networkService: NetworkServicing) { // IoC using DI
    self.networkService = networkService
  }

  func buttonTapped() {
    networkService.callAPI()
  }
}


let alamofire = Alamofire()
//let viewModel = ViewModel(networkService: alamofire)





//---------------------------------------

















// Is our problem solved?
// Can we replace the dependency easily?








class AnotherService: NetworkServicing {
  func callAPI() {}
}

let anotherService = AnotherService()

//var networkService: NetworkServicing = if true {
//    Alamofire()
//} else {
//   AnotherService()
//}

let viewModel = ViewModel(networkService: anotherService)









