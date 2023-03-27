import UIKit


var referenceFuelValue = 68200
func calculateFuel(calc: (Int, Int) -> Int) -> Bool {
    
    let distance = 1000
    let weight = 600
    let sumFuel = calc(distance, weight)
    print(calc(distance, weight))
    if calc(distance, weight) == referenceFuelValue {
        return true
    } else {
        return false
    }
}


let engineerFirst = { (distance: Int, weight: Int) -> Int in
    let sumFuel = (distance * 3) + (weight * 5)
    return sumFuel
}

let engineerSecond = { (distance: Int, weight: Int) -> Int in
    let sumFuel = (distance * 67) + (weight * 2)
    return sumFuel
}

calculateFuel(calc: engineerFirst)
calculateFuel(calc: engineerSecond)



let abbreviatedCalculationFirst: (Int, Int) -> Int = { $0 * 3 + $1 * 5 }
let abbreviatedCalculationSecond: (Int, Int) -> Int = {$0 * 67 + $1 * 2}

calculateFuel(calc: abbreviatedCalculationFirst)
calculateFuel(calc: abbreviatedCalculationSecond)
