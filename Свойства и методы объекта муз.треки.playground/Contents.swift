import UIKit
import Foundation

enum Compositor: String {
    case AntonioLucioVivaldi = "Антонио Лучио Вивальди"
    case LinkinPark
    case Evanescence
    case Sting
    case Queen
    case Maksim = "Максим"
    case LudovicoEinaudi
    case Earthlings = "Земляне"
}

enum Countries: String {
    case Russia = " Российская Федерация"
    case HolyRomanEmpire = "Священная Римская Империя"
    case USSR = "СССР"
    case USA = "Америка"
    case EU = "Европейский союз"
    case China = "Китай"
    
}



struct Track {
    var name: String
    var compositor: Compositor
    var long: Double
    var country: Countries
    
}



class Category {
    
    var name: String
    var compositor: Compositor
    lazy var trackList: [Track] = []
    
    init(name: String, compositor: Compositor) {
        self.compositor = compositor
        self.name = name
    }
    
    func addTrack(newTrack: Track) {
        trackList.append(newTrack)
    }
    
    func removeTrackbyName(delNameTrack: String) {
        for (i,j) in trackList.enumerated() {
            if (j.name == delNameTrack) {
                print(i,j.name)
                trackList.remove(at: i)
            }
        }
    }
    
    func removeTrack(delNameTrack: Track) {
        for (i,j) in trackList.enumerated() {
            if (j.name == delNameTrack.name) {
                trackList.remove(at: i)
                print("Трек \(delNameTrack.name) удален")
            }
        }
    }

    func numberOfTracks() -> Int {
        return trackList.count
    }
}

enum Cathegories: String {
    case Pop
    case Rock
    case Shanson
}

class Library {
    var name: String
    lazy var categoryList: [Category] = []
    var countCategoryList : Int {
        return categoryList.count
    }
    
    init(name: String) {
        self.name = name
    }
    
    func addCategory(newCategory: Category) {
        categoryList.append(newCategory)
    }
    func changeCategoryByTrack(track: Track, inCategory: Category, toCategory: Category) {
        inCategory.removeTrackbyName(delNameTrack: track.name)
        toCategory.addTrack(newTrack: track)
    }
    func removeCategory(delCategory: Category) {
        for (i,j) in categoryList.enumerated() {
            if (j.name == delCategory.name) {
                categoryList.remove(at: i)
                print("Категория \(delCategory.name) удалена")
            }
        }
    }
}

var library = Library(name: "Музыкальная библиотека")

var category1 = Category(name: "Rock", compositor: Compositor.Earthlings)
var category2 = Category(name: "Pop", compositor: Compositor.Maksim)
var category3 = Category(name: "Classic", compositor: Compositor.AntonioLucioVivaldi)

var track1 = Track(name: "Трава у дома", compositor: Compositor.Earthlings, long: 282, country: Countries.USSR)
var track2 = Track(name: "Знаешь ли ты", compositor: Compositor.Maksim, long: 400, country: Countries.Russia)
var track3 = Track(name: "Concerto No. 4 in F minor (L'inverno/ Winter) RV297 (Op. 8 No. 4): I. Allegro non molto", compositor: Compositor.AntonioLucioVivaldi, long: 208, country: Countries.HolyRomanEmpire)

library.addCategory(newCategory: category1)
library.addCategory(newCategory: category2)
library.addCategory(newCategory: category3)

category1.addTrack(newTrack: track1)
category1.addTrack(newTrack: track2)
category1.addTrack(newTrack: track3)



//Количество треков в категории 1
for i in category1.trackList {
    print(i.name)
}
//Удалим трек "Знаешь ли ты"
category1.removeTrackbyName(delNameTrack: "Знаешь ли ты" )


//Проверка кол-ва треков в категории 1
for i in category1.trackList {
    print(i.name)
}

//Проверка кол-ва треков в категории 2
for i in category2.trackList {
    print(i.name)
}

//Перенос трека с категории 1 в категорию 2
library.changeCategoryByTrack(track: track3, inCategory: category1, toCategory: category2)


//Проверка кол-ва треков в категории 1
for i in category1.trackList {
    print(i.name)
}

//Проверка кол-ва треков в категории 2
for i in category2.trackList {
    print(i.name)
}

//Проверка кол-ва треков в категории 3
for i in category3.trackList {
    print(i.name)
}
