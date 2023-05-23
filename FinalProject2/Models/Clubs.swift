

import Foundation
import CoreLocation

class Clubs: ObservableObject {
    @Published var list: [Club] = []
    
    @Published var selectedClub: Club?

    init() {
        
        
        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
                    
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
                let tempArray = tempDict["clubs"] as! Array<[String:Any]>
                
                var tempClubs: [Club] = []
                for dict in tempArray {
                    let clubName = dict["clubName"]! as! String
                    let arenaName = dict["arenaName"]! as! String
                    let dateFormed = dict["dateFormed"]! as! String
                    let capacity = dict["capacity"]! as! String
                    let link = dict["link"]! as! String
                    let link2 = dict["link2"]! as! String
                    let link3 = dict["link3"]! as! String
                    let link4 = dict["link4"]! as! String
                    let imageLink = dict["imageLink"]! as! String
                    let lyrics = dict["lyrics"]! as! String
                    let lyrics2 = dict["lyrics2"]! as! String
                    let lyrics3 = dict["lyrics3"]! as! String
                    let lyrics4 = dict["lyrics4"]! as! String
                    let imageType = dict["imageType"]! as! String
                    
                    //you need to provide all of the values from the plist and possibly modify the initializer with any new values...
                    let p = Club(clubName: clubName, arenaName: arenaName, dateFormed: dateFormed, capacity: capacity, link: link, imageLink: imageLink, lyrics: lyrics, imageType: imageType, lyrics2: lyrics2, lyrics3: lyrics3, lyrics4: lyrics4, link2: link2, link3: link3, link4: link4)
                    
                    tempClubs.append(p)
                }
                            
                
                for p in tempClubs {
                     print("Club: \(p)")
                }
                            
                
                print("There are \(tempClubs.count) landmarks")
                print("\(tempClubs)")

                self.list = tempClubs.sorted(by:{ $0.getClubName() < $1.getClubName() })
            
                print(self.list)
            } catch {
                print(error)
            }
        }
    
    }
}

