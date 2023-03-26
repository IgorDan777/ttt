import UIKit


var referenceFuelValue = 1800
func calculateFuel(Height: Int, Width: Int, calc: (Int, Int) -> Int) -> Bool {
    
    print(calc(Height, Width))
    if calc(Height, Width) == referenceFuelValue {
        return true
    } else {
        return false
    }
}

//первый инженер
calculateFuel(Height: 77, Width: 21, calc: { (Height: Int, Width: Int) -> Int in
    var fuelConsumption = (Height * Width)
    return fuelConsumption
})

//второй инженер
calculateFuel(Height: 7, Width: 11, calc: { (Height: Int, Width: Int) -> Int in
    var fuelConsumption = (Height * Width)*2
    return fuelConsumption
})



calculateFuel(Height: 6, Width: 4) {($0 * $1) * 6}
calculateFuel(Height: 56, Width: 24) {($0 * $1) * 8}
calculateFuel(Height: 2, Width: 452) {($0 * $1) * 7}
calculateFuel(Height: 253, Width: 67) {($0 * $1) * 100}

