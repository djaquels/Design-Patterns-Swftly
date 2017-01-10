// Clients never create a platform object
// They ask the factory to do that for them.
/*
 The goal is to provide an interface of
 creating families os related objects
 without specifying their concrete classes.
*/
// We must need a clien and a factory

// Create an abstract product (Pokemons in this case)
protocol Pokemon {
  // This is the definiton of an Abstract
  // Pokemon with methods and propertis
  var name: String {get }
  var rank: Int {get }
  var pokemonType: String {get}
  func sayHello()-> String
}
// Define some concrete tipes of Pokemons
class concreteFirePokemon : Pokemon{
  var name: String
  var rank: Int
  var pokemonType: String { return "Fire"}
  init(cname:String,crank:Int) {
   self.name  = cname
   self.rank  =  crank
  }
  func sayHello() -> String {
    return "Hello my names is: " + name + " i am a" + pokemonType + " pokemon"

  }

}
class concreteElectricPokemon: Pokemon{
  var name: String
  var rank: Int
  var pokemonType: String {return  "Electric"}
  init(cname:String,crank:Int) {
   self.name  = cname
   self.rank  =  crank
  }
  func sayHello() -> String {
    return "Hello my names is: " + name + " i am a" + pokemonType + " pokemon"

  }

}
class concreteLuchaPokemon : Pokemon{
  var name: String
  var rank: Int
  var pokemonType: String { return "Lucha"}
  init(cname:String,crank:Int) {
   self.name  = cname
   self.rank  =  crank
  }
  func sayHello() -> String {
    return "Hello my names is: " + name + " i am a " + pokemonType + " pokemon"

  }

}
// Now create de Abstract factory
protocol factoryPokemon{
  // The factory can make between a Fire, Electric or a Lucha pokemon
   func makeFire(name:String,rank:Int) -> concreteFirePokemon
   func makeElectric(name:String,rank:Int) -> concreteElectricPokemon
   func makeLucha(name:String,rank:Int) -> concreteLuchaPokemon
}
// The concrete pokemon factory
class PokemonFactory : factoryPokemon {
  func makeFire(name:String,rank:Int)-> concreteFirePokemon {
    return concreteFirePokemon(cname:name,crank:rank)
  }
  func makeElectric(name:String,rank:Int) -> concreteElectricPokemon{
    return concreteElectricPokemon(cname:name,crank:rank)
  }
  func makeLucha(name:String,rank:Int) -> concreteLuchaPokemon {
    return concreteLuchaPokemon(cname:name,crank:rank)
  }

}
// Now we can build pokemons trough factory
// Here some examples
let factory = PokemonFactory()
let charmander = factory.makeFire(name:"Charmander",rank:500)
print(charmander.sayHello())
let hawlucha = factory.makeLucha(name:"HawLucha",rank:800)
print(hawlucha.sayHello()
// Now Add tipes of pokemons is just easy!, just modifying the factory
