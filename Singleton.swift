/*
 Application needs one, and only one, instance of an object.
 Additionally, lazy initialization and global
 access are necessary.
*/
class Domain {
  static let browser = Domain() // initialization inside class
  // domain only acessed from class
  private var url = "http://www.github.com"
  private init(){} // Make constructor private
  // Declare public functions to set and get values
  func getURL() {
      print("Current Browsing: \(url)")
  }
  func  setURL(newURL: String) {
      print("New Website")
      url = newURL
  }
}
// Now using the borwser
Domain.browser.getURL()
Domain.browser.setURL(newURL:"http://www.xvideos.com")
Domain.browser.getURL()
