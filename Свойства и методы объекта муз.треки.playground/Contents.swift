import UIKit
import Foundation

enum Countries: String {
    case Russia
    case USA
    case EU
    case China
}



class Track {
    var name: String
    var compositor: String
    var long: Double
    var country: Countries
    
    init(name: String, compositor: String, long: Double, country: Countries) {
        self.name = name
        self.compositor = compositor
        self.long = long
        self.country = country
    }
}



class Cathegory {
    
    var name: String = ""
    lazy var trackList: [Track] = []
    func addNewTrack(track: Track) {
        trackList.append(track)
    }

    func removeTrack() {
        trackList.removeLast()
}
}

enum Cathegories: String {
    case Pop
    case Rock
    case Shanson
}

class Library {
    var cathegories: [Cathegory] = []
}

let library = Library()

let popMusic = Cathegory()
let rockMusic = Cathegory()
let shanson = Cathegory()

library.cathegories.append(popMusic)
library.cathegories.append(rockMusic)
library.cathegories.append(shanson)

library.cathegories[0].name = Cathegories.Pop.rawValue
library.cathegories[1].name = Cathegories.Rock.rawValue
library.cathegories[2].name = Cathegories.Shanson.rawValue
