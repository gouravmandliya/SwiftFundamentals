
import Foundation


protocol ProductProtocol {
 
    var maxlimit : Int { get set }
    
    func manufacture()
}


class Keyboard :ProductProtocol{
 
    var maxlimit: Int = 0
    func manufacture() {
        print("keyboard manufacturing started")
    }
    
}

class Mouse : ProductProtocol {
  
    
    var maxlimit: Int = 0
    
    func manufacture() {
        print("mouse manufacturing started")
    }
}

enum ProductType{
    case keyboard
    case mouse
}


class ProductFactory {
    func getProduct(type:ProductType)->  ProductProtocol{
        switch type {
        case .keyboard:
            return Keyboard()
        case .mouse:
            return Mouse()
        }
    }
}

class ProductViewModel {
    
    var product: ProductProtocol?
    
    init(_product: ProductProtocol) {
        product = _product
    }
    
    func startManufactring() {
        
        product?.manufacture()
    }
    
}


let vm = ProductViewModel(_product: ProductFactory().getProduct(type: .mouse))

vm.startManufactring()

