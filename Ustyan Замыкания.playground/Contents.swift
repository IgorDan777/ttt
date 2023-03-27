import UIKit

////task1
//var referenceFuelValue = 1800
//func calculateFuel(lenght: Int, weight: Int, calc: (Int, Int) -> Int) -> Bool {
//
//    print(calc(lenght, weight))
//    if calc(lenght, weight) == referenceFuelValue {
//        return true
//    } else {
//        return false
//    }
//}
//
////первый инженер
//calculateFuel(lenght: 60, weight: 30, calc: { (lenght: Int, weight: Int) -> Int in
//    var fuelConsumption = (lenght * weight)
//    return fuelConsumption
//})
//
////второй инженер
//calculateFuel(lenght: 60, weight: 30, calc: { (lenght: Int, weight: Int) -> Int in
//    var fuelConsumption = (lenght * weight)*2
//    return fuelConsumption
//})
//
////task2
////сокращеная запись
//calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 2}
//calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 3}
//calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 4}
//calculateFuel(lenght: 60, weight: 40) {($0 * $1) * 5}



//1

func calculateFuelUsage(fuelUsage: (Double, Double) -> Double) {
    let satelliteWeight = 1000.0   // вес спутника в кг
    let distance = 600.0           // длина полета в млн км
    let fuel = fuelUsage(satelliteWeight, distance)
    print("Расход топлива: \(fuel) л")
}

let fuelUsage1 = { (satelliteWeight: Double, distance: Double) -> Double
    in
    let fuel = (satelliteWeight * 0.1) + (distance * 0.05)
    return fuel
}

let fuelUsage2 = { (satelliteWeight: Double, distance: Double) -> Double
    in
    let fuel = (satelliteWeight * 0.15) + (distance * 0.1)
    return fuel
}
calculateFuelUsage(fuelUsage: fuelUsage1)

calculateFuelUsage(fuelUsage: fuelUsage2)
print(" ")

//2

func calculateFuelUsage1(fuelUsage: (Double, Double) -> Double) {
    let satelliteWeight = 1000.0
    let distance = 600.0
    let fuel = fuelUsage(satelliteWeight, distance)
    print("Расход топлива: \(fuel) л")
}

let fuelUsage3: (Double, Double) -> Double = { $0 * 0.1 + $1 * 0.05 }
let fuelUsage4: (Double, Double) -> Double = { $0 * 0.15 + $1 * 0.1 }

calculateFuelUsage1(fuelUsage: fuelUsage3)
calculateFuelUsage1(fuelUsage: fuelUsage4)
