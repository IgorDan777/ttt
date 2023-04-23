import UIKit
import Foundation

func square (_ value: Int) -> Int {
    return value * value
   
}
print(square(9))


class Circle {
    var radius: Double
    var area: Double {
        return .pi * (radius * radius)
    }
    init(radius: Double) {
        self.radius = radius
        
    }
}
var circ = Circle(radius: 3)
print("area = \(circ.area)")

