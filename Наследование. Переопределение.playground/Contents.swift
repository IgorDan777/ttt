import UIKit

// Задание 1
enum Style: String {
    case pop = "Популярная музыка"
    case rock = "Рок"
    case rep = "Рэп"
}

enum Country: String {
    case Russia = " Российская Федерация"
    case HolyRomanEmpire = "Священная Римская Империя"
    case USSR = "СССР"
    case USA = "Америка"
    case EU = "Европейский союз"
    case China = "Китай"
    case Finland = "Финляндия"
    
}

class Artist {
    var name: String
    var country: Country
    var style: Style
    var track = "My Immortal"
    
    
    init(name: String, country: Country, style: Style) {
        self.name = name
        self.country = country
        self.style = style
    }
    
    func writeTrack () {
        print("Я, \(name), написал трек \(track).")
    }
    func singTrack() {
        print("Я, \(name), исполнил трек \(track).")
    }
}

final class CheerfulArtist: Artist {
    var supportCommand: String = "Группа поддержки"
    
    func demonstrateGreeting () {
        print("\(supportCommand) выступает перед концертом!")
    }
    override func writeTrack () {
        print("Я, \(name), написал веселый трек.")
    }
    override func singTrack() {
        print("Я, \(name), исполнил веселый трек.")
    }
}

final class SadArtist: Artist {
    var priceTicket: Int
    
    init(priceTicket: Int, name: String, country: Country, style: Style){
        self.priceTicket = priceTicket
        super.init(name: name, country: country, style: style)
    }
    
    func GetPrice() {
        print("Стоимость билета = \(priceTicket)")
    }
    override func writeTrack () {
        print("Я, \(name), написал грустный трек.")
    }
    override func singTrack() {
        print("Я, \(name), исполнил грустный трек.")
    }
}

final class PopularArtist: Artist {
    var tourDate: String
    
    init(tourDate: String, name: String, country: Country, style: Style){
        self.tourDate = tourDate
        super.init(name: name, country: country, style: style)
    }
    
    func showTourDate () {
        print("Ближайший тур состоится \(tourDate) в Москве.")
    }
    
    override func writeTrack () {
        print("Я, \(name), написал популярный трек.")
    }
    override func singTrack() {
        print("Я, \(name), исполнил популярный трек.")
    }
}

var cheerfulArtist = CheerfulArtist(name: "Вася", country: .Finland, style: .pop)
var sadArtist = SadArtist(priceTicket: 1500, name: "Оля", country: .Finland, style: .rock)
var popularArtist = PopularArtist(tourDate: "31.03.2023", name: "Тилль Линдеманн", country: .Russia, style: .rock)

//Вызываем унаследованный метод
popularArtist.singTrack()
popularArtist.writeTrack()

// Задание 2 и 3

private var artists = [Artist]()

artists.append(cheerfulArtist)
artists.append(sadArtist)
artists.append(popularArtist)

