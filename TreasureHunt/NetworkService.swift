
import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

class NetworkService {
    
    private let baseUrl = "http://0.0.0.0:8080/api"
    
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
    
    // MARK: Beacon
    func getBeaconsList(completionHandler: [Beacon] -> Void, errorHandler: NSError -> Void) {
        Alamofire.request(.GET, baseUrl + "/beacons").responseJSON { response in
            if (response.result.error == nil) {
                if let result = response.result.value {
                    guard let beacons = result["beacons"] as? [[String:AnyObject]] else {
                        errorHandler(NSError(domain: "No beacons property", code: 10001, userInfo: nil))
                        return
                    }
                    
                    let beaconList = beacons.flatMap({ (jsonObject: [String:AnyObject]) -> Beacon? in
                        return Mapper<Beacon>().map(jsonObject)
                    })
                    
                    completionHandler(beaconList)
                }
            } else {
                print(response.result.error)
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
                            if let id = adventure["id"] as? String, name = adventure["name"] as? String, description = adventure["description"] as? String, items = adventure["items"] as? [[String:AnyObject]] {
                                
                                var responseItems = [Item]()
                                
                                responseItems = items.flatMap({ (jsonObject: [String:AnyObject]) -> Item? in
                                    return Mapper<Item>().map(jsonObject)
                                })
                                
                                let newAdventure = Adventure(id: id, name: name, description: description, items: responseItems)
                                
                                adventuresList.append(newAdventure)
                            }
                        }
                        completionHandler(adventures: adventuresList)
                    }
                    
                }
            }
        }
    }
    
    // MARK: Item
//    func annotateItemsList(itemsList: [Item]) -> [Item] {
//        
//        var beaconsList = [Beacon]()
//        
//        getBeaconsList { (beacons) in
//            beaconsList = beacons
//        }
//        
//        for (index, item) in itemsList.enumerate() {
//            
//        }
//        
//        return itemsList
//    }
}