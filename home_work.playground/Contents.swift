import UIKit
import Foundation


enum Channels: String {
    case firstChannel = "Первый канал"
    case secondChannel = "РТР"
    case thirdChannel = "РЕНТВ"
    case fourthChannel = "СпортТВ"
    case fifthChannel = "Культура"
}

class Tv {
    var model: (String)
    var isOn: (Bool)
    var currentChannel: Channels
    
    init(model:String, isOn:Bool, currentChannel: Channels) {
        self.model = model
        self.isOn = isOn
        self.currentChannel = currentChannel
    }
    
    
    func showCurrentChannel() {
        if isOn {
            print("Вы смотрите \(currentChannel.rawValue)")
        } else {
            print("Телевизор сейчас выключен")
        }
    }
}
var telek = Tv(model: "SAMSUNG", isOn: true, currentChannel: Channels.fourthChannel)

telek.currentChannel = .secondChannel
telek.showCurrentChannel()

telek.isOn = false
telek.showCurrentChannel()
