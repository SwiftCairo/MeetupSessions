import Foundation

protocol SomeDelegate: class {
    func itemSomething(item:Any, didThatThing thing: Any)
}

class FooController: NSObject {
    weak var delegate: SomeDelegate?
    
    override init() {
        super.init()
        delegate = self
    }
    
    deinit {
        print("FooController is going away")
    }
}

extension FooController: SomeDelegate {
    func itemSomething(item: Any, didThatThing thing: Any) {
        print("That Item did its thing")
    }
}

do {
    let foo = FooController()
    foo.itemSomething(item: foo, didThatThing: 1)
}
