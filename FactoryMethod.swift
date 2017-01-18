/*
 Factory Method Desing Pattern
 Define an interface for creating an object, but let subclasses
 decide which class to instantiate. Factory Method lets
 a class defer instantiation to subclasses.
*/
import Foundation
// Create the interface
struct cardID{ // Struct of a Library Book ID
  var name = ""
  var author = ""
  var pages: Int?
  var id = 0
  var genre = ""
}
class Book { // Generic class for a Book
  var ID = cardID()
  init(names:String,authors:String,pagess:Int,n:Int) {
    self.ID = cardID()
    self.ID.name = names
    self.ID.author = authors
    self.ID.pages = pagess
    self.ID.id = n
    self.ID.genre = ""
  }
  func showInfo() {
      print("Name: \(self.ID.name)")
      print("Author: \(self.ID.author)")
      print("Pages: \(self.ID.pages)")
      print("ID: \(self.ID.id)")
      print("Genre: \(self.ID.genre)")
  }

}
class Fiction:Book{
  // Override genre property
  override init(names:String,authors:String,pagess:Int,n:Int) {
  super.init(names:names,authors:authors,pagess:pagess,n:n)
   super.ID.genre = "Fiction"
  }
}
class Novel:Book{
  // Override genre property
  override init(names:String,authors:String,pagess:Int,n:Int) {
  super.init(names:names,authors:authors,pagess:pagess,n:n)
  super.ID.genre = "Novel"
  }
}
protocol BookFactory{
  func createBook()-> Book // Creates a Book

}
class Library : BookFactory{
  func createBook()->Book {
    print("Name:")
    let name = readLine(strippingNewline: true)
    print("Author:")
    let author = readLine(strippingNewline: true)
    print("Pages:")
    let page = Int(readLine(strippingNewline: true)!)
    print("ID:")
    let id = Int(readLine(strippingNewline: true)!)
    print("Genre:")
    let genre = readLine(strippingNewline: true)
    if (genre == "Fiction"){
      let book = Fiction(names:name!,authors:author!,pagess:page!,n:id!)
      return book

    }else{
      let book = Novel(names:name!,authors:author!,pagess:page!,n:id!)
      return book
    }
  }
}
var library = Library()
let harryPotter = library.createBook()
harryPotter.showInfo()
