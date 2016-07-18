
import Foundation
import Alamofire

class NetworkService: NSObject {
    
    private let baseUrl = "localhost/api"
    
    static let sharedInstance = NetworkService()
    
    // MARK: User
    func getUserProfile(completionHandler:(result: [Profile]) -> Void) {
        var result = [Profile]()
        Alamofire.request(.GET, baseUrl + "/users")
            .responseJSON { response in
                if (response.result.error == nil) {
                    
                }
            }
    }
    
    // MARK: Item
    func loadItems() -> [Item] {
        var items: [Item] = []
        let item0 = Item(name: "Map piece no.1", desc: "By the door next to the cafeteria", major: 46880, minor: 36104)
        let item1 = Item(name: "Map piece no.2", desc: "In front of room B204", major: 57832, minor: 7199)
        let item2 = Item(name: "Map piece no.3", desc: "Second floor Bathroom", major: 911, minor: 912)
        
        items.append(item0)
        items.append(item1)
        items.append(item2)
        
        return items
    }
    
    // MARK: Adventure
    func loadAdventure() -> Adventure {
        let adventureItems: [Item] = loadItems()
        let adventure =  Adventure(name: "Path of the Prophet", desc: "You are a PROPHET, go do some stuff searching, missions moving, people helping thing that you always do", item: adventureItems)
        
        return adventure
    }
}