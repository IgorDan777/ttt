import UIKit

enum Accesories: String {
    case videoRegistrator = "Регистратор"
    case acusticSystem = "Harman Kardon"
    case parkingAssistant = "Parking assistant plus"
    case surroundSoundSystem = "Surround Sound System"
    case mPerformance = "M - пакет"
    case firstAidKit = "Аптечка"
    case fireExtinguisher = "Огнетушитель"
}

enum OfferError: Error {
    case notRelevant
}

 protocol Car {
    var model: String { get }
    var color: String { get }
    var buildDate: Int { get }
    var price: Double { get set }
    var accessories: [Accesories] { get set }
    var isServiced: Bool { get set }
}


 protocol Dealership {
    
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Car]  { get set }
    var showroomCars: [Car] { get set }
    var cars: [Car] { get }
    
    func offerAccesories(accessories: [Accesories])
    func presaleService(car: Car)
    func addToShowroom(car: Car)
    func sellCar(car:  Car)
    func orderCar()
}

public protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer() throws
}


struct Cars: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [Accesories]
    var isServiced: Bool
}
var bmw: Car = Cars(model: "BMW Х2", color: "Black", buildDate: 2023, price: 10_000_000, accessories: [.mPerformance], isServiced: false)
var mercedesBenzC250AMGstyle: Car = Cars(model: "Mercedes-Benz C-250 AMG style", color: "brown", buildDate: 2013, price: 1_200_000, accessories: [.acusticSystem], isServiced: true)
var audi: Car = Cars(model: "Audi Q7", color: "Red", buildDate: 2022, price: 12_000_000, accessories: [.mPerformance], isServiced: true)
var lexus: Car = Cars(model: "Lexus NX", color: "White", buildDate: 2019, price: 7_000_000, accessories: [.surroundSoundSystem], isServiced: false)
var volvo: Car = Cars(model: "Volvo S60", color: "Silver", buildDate: 2022, price: 5_000_000, accessories: [.surroundSoundSystem], isServiced: true)


class Dealer: Dealership {
    
    var name: String
    var showroomCapacity = 2
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars: [Car] {
        get { stockCars + showroomCars}
        set {stockCars = Array(newValue[0..<stockCars.count])
            showroomCars = Array(newValue.suffix(from: stockCars.count))
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func offerAccesories(accessories: [Accesories]) {
        print("Would you like to buy \(accessories)?")
    }
    
    func presaleService( car: Car) {
        if car.isServiced {
            print("\(car.model)  предпродажное обслуживание")
        } else {
            car.isServiced == true
            print("\(car.model) успешно проходит предпродажное обслуживание")
        }
    }
    
    func addToShowroom(car: Car) {
        if showroomCars.count < showroomCapacity {
            presaleService(car: car)
            stockCars.removeAll { $0.model == car.model }
            print("\(car.model) был доставлен в выставочный зал")
            showroomCars.append(car)
        } else {
            print("недостаточно места")
        }
    }
    
    func sellCar(car: Car) {
        if showroomCars.contains(where: {$0.model == car.model}) {
            offerAccesories(accessories: car.accessories)
            showroomCars.removeAll {$0.model == car.model}
            cars.removeAll {$0.model == car.model}
            print("\(car.model) продается ")
        } else {
            print("\(car.model)  нет в выставочном зале")
        }
    }
   

    var producedCars = [bmw, mercedesBenzC250AMGstyle, audi,lexus, volvo]
    
    func orderCar() {
        let newCar = producedCars.randomElement()
        print("New \(String(describing: newCar)) добавлен в Дилерский центр")
        stockCars.append(newCar!)
    }
}
class BmwDealer: Dealer {}
let bmwDealer = BmwDealer(name: "BMW -Удовольствие от вождения")

class MercedesBenzDealer: Dealer {}
let mercedesBenzDealer = MercedesBenzDealer(name: "Лучшее или ничего!")

mercedesBenzDealer.offerAccesories(accessories: [.acusticSystem, .fireExtinguisher, .firstAidKit, .mPerformance, .parkingAssistant, .surroundSoundSystem, .videoRegistrator])
print("-----------------------------")
mercedesBenzDealer.presaleService(car: mercedesBenzC250AMGstyle)
print("-----------------------------")
mercedesBenzDealer.addToShowroom(car: mercedesBenzC250AMGstyle)
print("-----------------------------")
mercedesBenzDealer.sellCar(car: mercedesBenzC250AMGstyle)
print("-----------------------------")
mercedesBenzDealer.orderCar()
print("-----------------------------")


class LexusDealer: Dealer {}
var lexusDealer = LexusDealer(name: "Стремление к совершенству")

class AudiDealer: Dealer {}
var audiDealer = AudiDealer (name: "Преимущества в технологиях")

class VolvoDealer: Dealer {}
var volvoDealer = VolvoDealer (name: "Volvo на всю жизнь!")


bmwDealer.orderCar()
mercedesBenzDealer.orderCar()
audiDealer.orderCar()
lexusDealer.orderCar()
volvoDealer.orderCar()
print("----------------------------")
bmwDealer.addToShowroom(car: bmw)
mercedesBenzDealer.addToShowroom(car: mercedesBenzC250AMGstyle)
audiDealer.addToShowroom(car: audi)
lexusDealer.addToShowroom(car: lexus)
volvoDealer.addToShowroom(car: volvo)


print("--------------------------")
let arrayOfDealers = [bmwDealer, audiDealer, lexusDealer, volvoDealer, mercedesBenzDealer ]

for dealer in arrayOfDealers {
    if let dealerClass = dealer as? BmwDealer {
        print(dealerClass.name)
    }
    if let dealerClass = dealer as? MercedesBenzDealer {
        print(dealerClass.name)
    }
    if let dealerClass = dealer as? LexusDealer {
        print(dealerClass.name)
    }
    if let dealerClass = dealer as? AudiDealer {
        print(dealerClass.name)
    }
    if let dealerClass = dealer as? VolvoDealer {
        print(dealerClass.name)
    }
}


extension BmwDealer: SpecialOffer {
    
    func addEmergencyPack() {
        for index in cars.indices {
            cars[index].accessories.append(.firstAidKit)
            cars[index].accessories.append(.fireExtinguisher)
        }
    }
     func makeSpecialOffer() throws {
        for car in cars.indices {
            guard cars[car].buildDate < 2023 else {
                throw OfferError.notRelevant
            }
            print("Специальное предложение 20% специально для вас")
            
            addEmergencyPack()
            print("Добавлены аптечка и огнетушитель")
        }
    }
}
print("-----------------------------")
bmwDealer.cars

    do {
        let offerPrice: () = try bmwDealer.makeSpecialOffer()
        print("Специальное предложение 20% специально для вас ) \(offerPrice)")
    } catch OfferError.notRelevant {
        print("Предложение не распространяется на автомобили произведенные в 2023 году")
    }


extension MercedesBenzDealer: SpecialOffer {

    public func addEmergencyPack() {
        for index in cars.indices {
            cars[index].accessories.append(.firstAidKit)
            cars[index].accessories.append(.fireExtinguisher)
        }
    }
    public func makeSpecialOffer() {
        for car in cars.indices {
            if cars[car].buildDate < 2023 {
                print("Специальное предложение 20% специально для вас")
            }
            addEmergencyPack()
            print("Добавлены аптечка и огнетушитель")
        }
    }
}




extension AudiDealer: SpecialOffer {

    public func addEmergencyPack() {
        for index in cars.indices {
            cars[index].accessories.append(.firstAidKit)
            cars[index].accessories.append(.fireExtinguisher)
        }
    }
    public func makeSpecialOffer() {
        for car in cars.indices {
            if cars[car].buildDate < 2023 {
                print("Специальное предложение 15% специально для вас")
            }
            addEmergencyPack()
            print("Добавлены аптечка и огнетушитель")
        }
    }
}


