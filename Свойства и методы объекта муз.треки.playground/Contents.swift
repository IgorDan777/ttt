import UIKit

enum Countries: String {
    case USSR = "СССР"
    case Russia = "Россия"
    case China = "Китай"
    case EU = "Европа"
    case USA = "США"
}

class Track {
    var name: String
    var compositor: String
    var long: Float
    var country: String
    
    init(name: String, compositor: String, long: Float, country: String) {
        self.name = name
        self.compositor = compositor
        self.long = long
        self.country = country
        
    }
}

class Category {
    var name: String = ""
    lazy var trackList: [Track] = []
    func addNewTrack(track: Track) {
        trackList.append(track)
    }
    func removeTrack() {
        trackList.removeLast()
    }
}

let category = Category()


let track = Track(name: "Трава у дома", compositor: "Владимир Мигуля", long: 4.42,
                  country: Countries.USSR.rawValue)

let secondTrack = Track(name: "Лесник", compositor: "Король и Шут", long: 3.11,
                        country: Countries.Russia.rawValue)

category.addNewTrack(track: track)
category.addNewTrack(track: secondTrack)

category.trackList.count

category.removeTrack()
category.trackList.count
