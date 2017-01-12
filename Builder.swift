// Builder Desing Pattern
/*
 Separate the construction of a complex object from
 its representation so that the same construction
 process can create different representations.

*/

// We need:
// A Director, A Builder , A Client and Product
// Example: A Burger Fast Food Restaurant
// We define tipes for project
enum Burger { // A burger can be one of these
 case chessBurger
 case chickernBurger
 case beefBurger
}
 enum Drink { // A coke can be one ot these
 case cocaCola
 case pepsiCola
 }
 enum Complement { // Second item of package
 case frenchFries
 case wings
 }
 enum Toy{ // Two types of toys
 case forBoy
 case forGirl
 }
 // Structure of a generic package
class BurgerPackage{
  var burger: Burger = Burger.chessBurger
  var drink: Drink = Drink.pepsiCola
  var complement:Complement = Complement.frenchFries
  var toy: Toy = Toy.forGirl
}
// Build abstract protocol to create all of possible packages
protocol builderBurgers{
  var customerPackage: BurgerPackage {get} // Creates a new packages
  // Now the functions that creates all the variations
  func setBurger(burger:Burger)-> Burger
  func setDrink(drink:Drink)-> Drink
  func setComplement(complement:Complement)-> Complement
  func setToy(toy:Toy)-> Toy
}
// Define concrete package Builder
class PackageMaker : builderBurgers {
  var customerPackage: BurgerPackage
  // functions that makes custome packages
  func setBurger(burger:Burger) -> Burger {
    switch burger {
    case .chickernBurger:
      customerPackage.burger = Burger.chickernBurger
      return Burger.chickernBurger
    case .beefBurger:
      customerPackage.burger = Burger.beefBurger
      return Burger.beefBurger
    default:
      return Burger.chessBurger

    }
  }
  func setDrink(drink: Drink)-> Drink {
      switch drink {
      case .cocaCola:
        customerPackage.drink = Drink.cocaCola
        return Drink.cocaCola
      default:
        return Drink.pepsiCola

      }
  }
  func setComplement(complement:Complement)-> Complement {
    switch complement {
    case .wings:
      customerPackage.complement = Complement.wings
      return Complement.wings
    default:
      return Complement.frenchFries

    }

  }
  func setToy(toy:Toy)->Toy{
    switch toy {
    case .forBoy:
      customerPackage.toy = Toy.forBoy
      return Toy.forBoy
    default:
      return Toy.forGirl

    }
  }
  init(burger:Burger,drink:Drink,complement:Complement,toy:Toy){
    self.customerPackage = BurgerPackage()
    setBurger(burger:burger)
    setDrink(drink:drink)
    setComplement(complement:complement)
    setToy(toy:toy)
    }
  }
  // Now make some packages
  let client = PackageMaker(burger:Burger.beefBurger,drink:Drink.pepsiCola,complement:Complement.wings,toy:Toy.forBoy)
  print("Burger: \(client.customerPackage.burger)")
  print("Drink: \(client.customerPackage.drink)")
  print("Complement: \(client.customerPackage.complement)")
  print("Toy: \(client.customerPackage.toy)")
