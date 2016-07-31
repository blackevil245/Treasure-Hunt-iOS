
import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    
    private let baseUrl = "localhost/api"
    
    static let sharedInstance = NetworkService()
    
    // MARK: User
    func login(username: String, password: String, completionHandler: (check: Bool) -> Void) {
        Alamofire.request(.GET, baseUrl + "/profiles", parameters: ["username": username, "password": password]).responseJSON { response in
                if (response.result.error === nil) {
                    if let result = response.result.value {
                        if let check = result["response"] as? String {
                            if check == "succeed" {
                                completionHandler(check: true)
                            } else {
                                completionHandler(check: false)
                            }
                        }
                    }
                } else {
                    completionHandler(check: false)
                }
        }
    }
    
    // MARK: Item
    func getItemsList(completionHandler: (items: [Item]) -> Void) {
        Alamofire.request(.GET, baseUrl + "/items").responseJSON { response in
            if (response.result.error == nil) {
                if let result = response.result.value {
                    
                    var itemsList = [Item]()
                    
                    if let items = result["items"] as? [AnyObject] {
                        for item in items {
                            if let uuid = item["uuid"] as? String, major = item["major"] as? String, minor = item["minor"] as? String {
                                let newItem = Item(uuid: uuid, major: major, minor: minor)
                                itemsList.append(newItem)
                            }
                        }
                        completionHandler(items: itemsList)
                    }
                }
            }
        }
    }
    
    // MARK: Adventure
    func loadAdventures(completionHandler: (adventures: [Adventure]) -> Void) {
        Alamofire.request(.GET, baseUrl + "/adventures").responseJSON { response in
            if (response.result.error == nil) {
                if let result = response.result.value {
                    
                    var adventuresList = [Adventure]()
                    
                    if let adventures = result["adventures"] as? [AnyObject] {
                        for adventure in adventures {
                            if let id = adventure["id"] as? String, name = adventure["name"] as? String, description = adventure["description"] as? String, items = adventure["items"] as? [AnyObject] {
                                let newAdventure = Adventure(id: id, name: name, description: description, item: items)
                                adventuresList.append(newAdventure)
                            }
                        }
                        completionHandler(adventures: adventuresList)
                    }
                    
                }
            }
        }
    }
}