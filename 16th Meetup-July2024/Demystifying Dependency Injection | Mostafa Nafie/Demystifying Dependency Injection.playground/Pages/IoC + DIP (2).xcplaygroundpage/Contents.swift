
protocol Routing {
  func goToScreen()
}

class Router: Routing {
  func goToScreen() {}
}

class ViewModel {
  var router: Routing? // DIP

  func buttonTapped() {
    router?.goToScreen()
  }
}



let router = Router()
let viewModel = ViewModel()
viewModel.router = router 


//let router = Router()
//container.register(router)
//viewModel.router = container.resolve()



//---------------------------------------
















// Is our problem solved?
// Can we test easily?











class RouterSpy: Routing {
  func goToScreen() {}
}


let routerSpy = RouterSpy()
viewModel.router = routerSpy









