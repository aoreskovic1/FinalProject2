

import Foundation
import CoreLocation
import MapKit

class Club: NSObject, Identifiable {
    var id = UUID()
    private var clubName : String = ""
    private var arenaName : String = ""
    private var dateFormed : String = ""
    private var capacity : String = ""
    private var link : String = ""
    private var link2 : String = ""
    private var link3 : String = ""
    private var link4 : String = ""
    
    
    private var imageLink : String = ""
    private var lyrics : String = ""
    private var lyrics2 : String = ""
    private var lyrics3 : String = ""
    private var lyrics4 : String = ""
    private var imageType : String = ""
    

    @objc override var description : String {
        return "{\n\t clubName: \(clubName)\n\t arenaName: \(arenaName)\n\t dateFormed: \(dateFormed)\n\t capacity: \(capacity)\n\t link: \(link)\n\t imageLink: \(imageLink)\n\t lyrics: \(lyrics)\n\t imageType: \(imageType)\n\t lyrics2: \(lyrics2)\n\t lyrics3: \(lyrics3)\n\t lyrics4: \(lyrics4)\n\t link2: \(link2)\n\t link3: \(link3)\n\t link4: \(link4)"
    }
    

    
   
     var title : String? {
        get {
            return clubName
        }
    }
    
     var subtitle : String? {
        get {
            return arenaName
        }
    }

    
    init(clubName: String, arenaName: String, dateFormed: String, capacity: String, link: String, location: CLLocation?, imageLink: String, lyrics: String, lyrics2: String, lyrics3: String, lyrics4: String, link2: String, link3: String, link4: String) {
        super.init()
        setClubName(clubName)
        setArenaName(arenaName)
        setDateFormed(dateFormed)
        setCapacity(capacity)
        setLink(link)
        setLink(link2)
        setLink(link3)
        setLink(link4)
        setImageLink(imageLink)
        setLyrics(lyrics)
        setLyrics2(lyrics2)
        setLyrics3(lyrics3)
        setLyrics4(lyrics4)
    }
    
    
    init(clubName: String, arenaName: String, dateFormed: String, capacity: String, link: String, imageLink: String, lyrics: String, imageType: String, lyrics2: String, lyrics3: String, lyrics4: String, link2: String, link3: String, link4: String) {
        super.init()
        setClubName(clubName)
        setArenaName(arenaName)
        setDateFormed(dateFormed)
        setCapacity(capacity)
        setLink(link)
        setLink2(link2)
        setLink3(link3)
        setLink4(link4)
        setImageLink(imageLink)
        setLyrics(lyrics)
        setImageType(imageType)
        setLyrics2(lyrics2)
        setLyrics3(lyrics3)
        setLyrics4(lyrics4)

    }
    
    
    convenience override init () {
        self.init(clubName: "Unknown", arenaName: "Unknown", dateFormed: "Unknown", capacity: "Unknown", link: "Unknown", imageLink: "Unknown", lyrics: "Unknown", imageType: "Unknown",  lyrics2: "Unknown",  lyrics3: "Unknown",  lyrics4: "Unknown", link2: "Unknown", link3: "Unknown", link4: "Unknown")
    }
    
    func getClubName() -> String {
        return clubName
    }
    func setClubName(_ value: String) {
        if value.count < 3 || value.count > 75 {
            self.clubName = "TBD"
            print("Bad value of \(value) in setClubName: setting to TBD")
        } else {
            self.clubName = value
        }
    }
    
    func getArenaName() -> String {
        return arenaName
    }
    func setArenaName(_ value: String) {
        if value.count < 3 || value.count > 75 {
            self.arenaName = "TBD"
            print("Bad value of \(value) in setArenaName: setting to TBD")
        } else {
            self.arenaName = value
        }
    }
    
    func getDateFormed() -> String {
        return dateFormed
    }
    func setDateFormed(_ value: String) {
        dateFormed = value
    }
    
    func getCapacity() -> String {
        return capacity
    }
    func setCapacity(_ value: String) {
        capacity = value
    }
    
    func getLink() -> String {
        return link
    }
    func setLink(_ value: String) {
        link = value
    }
    
    func getLink2() -> String {
        return link2
    }
    func setLink2(_ value: String) {
        link2 = value
    }
    
    func getLink3() -> String {
        return link3
    }
    func setLink3(_ value: String) {
        link3 = value
    }
    
    func getLink4() -> String {
        return link4
    }
    func setLink4(_ value: String) {
        link4 = value
    }

    func getImageLink() -> String {
        return imageLink
    }
    func setImageLink(_ value: String) {
        imageLink = value
    }
    
    func getLyrics() -> String {
        return lyrics
    }
    func setLyrics(_ value: String) {
        lyrics = value
    }
    func getLyrics2() -> String {
        return lyrics2
    }
    func setLyrics2(_ value: String) {
        lyrics2 = value
    }
    
    func getLyrics3() -> String {
        return lyrics3
    }
    func setLyrics3(_ value: String) {
        lyrics3 = value
    }
    
    func getLyrics4() -> String {
        return lyrics4
    }
    func setLyrics4(_ value: String) {
        lyrics4 = value
    }
    

    func getImageType() -> String {
        return imageType
    }
    func setImageType(_ value: String) {
        imageType = value
    }


}
