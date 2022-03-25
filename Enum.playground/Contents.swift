import UIKit
import PlaygroundSupport


//MARK:- An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

enum Barcode {
    case upc(numberSystem:Int,manufacturer: Int,product: Int,check: Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(numberSystem: 8, manufacturer: 85909, product: 51226, check: 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")


switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}


enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


//MARK:- Real world example

enum CarBrand: String, CaseIterable {
    case Mercedes = "Known for luxury and iconic design. Definitely my fav!"
    case Toyota = "Known for high-quality, high-value cars"
    case Volkswagen = "This is the people's car"
    case Ford = "Known for crisp handling, absorbent ride, and solid feel"
    case Honda = "Known for their well-built, reliable cars"
}


print(CarBrand.allCases.count)

for brand in CarBrand.allCases {
   // print(brand.rawValue)
}


func carKnownFor(brand: CarBrand) -> String {
    return brand.rawValue
}

carKnownFor(brand: .Ford)


enum MercedesModelPrice {
   case MayBach(price: Int)
   case AMG_GT(price: Int)
   case Metris(price: Int)
   case SprinterWagon(price: Int)
   case GClass(price:Int)
}


func getMercedesPrice(for mercedesModel: MercedesModelPrice) {
   switch mercedesModel {
   case .MayBach(price: let price) where price >= 100_000:
    print("You just bought yourself a new car")

   case .Metris(price: let price) where price >= 86_000:
    print("You just bought yourself a new car")

   case .AMG_GT(price: let price)  where price >= 74_000:
    print("You just bought yourself a new car")

   case .SprinterWagon(price: let price) where price >= 45_000:
     print("You just bought yourself a new car")

   case .GClass, .SprinterWagon, .Metris, .AMG_GT, .MayBach:
    print("Insufficient funds. You cant' afford this car at the moment")

   }
}

getMercedesPrice(for: .SprinterWagon(price: 200_000))



enum Validity {
    case valid
    case invalid(reason: String)
}


func validateStringLengthUptoFive(_ string: String) -> Validity {
    if string.count < 5 {
         return .valid
    } else {
        return .invalid(reason: "String too long")
    }
}


let validate:Validity = validateStringLengthUptoFive("flower")


switch validate {
case .invalid(reason: let reason):
    print(reason)
case .valid:
    print("Do further operations")
}



