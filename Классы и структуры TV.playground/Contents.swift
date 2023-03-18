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


struct SettingsTV  {
    var volume: Double
    var isColorView: Bool
}

enum VideoFormat: String {
    case tvChannel   = "режим просмотра каналов"
    case videoByPort = "режим видео по входящему видео порту"
}
class NewTv: Tv {
    private var currentVolume: Double = 0
    var currentVideoFormat: VideoFormat
    var maxVolume: Double = 1
    var settings: SettingsTV {
        willSet {
            if newValue.volume > maxVolume {
                self.currentVolume = 1
            } else if newValue.volume < 0 {
                self.currentVolume = 0
            } else {
                currentVolume = newValue.volume
            }
        }
    }

    init(currentVideoFormat: VideoFormat, settings: SettingsTV) {
        self.currentVideoFormat = currentVideoFormat
        self.settings = settings
        super.init(model:("Заря"), isOn: true, currentChannel: Channels.firstChannel)
    }
    
    override func showCurrentChannel(){
        var colorViewDesc: String
        if settings.isColorView {
            colorViewDesc = "цветной"
        } else {
            colorViewDesc = "черно-белый"
        }
        
        if currentVideoFormat == .tvChannel {
            print("Вы смотрите \(currentVideoFormat.rawValue).")
            print("Активный канал: \(currentChannel.rawValue).")
            print("Режим дисплея: \(colorViewDesc).")
            print("Громкость: \(currentVolume). ")
        } else if currentVideoFormat == .videoByPort{
            print("Вы смотрите \(VideoFormat.videoByPort.rawValue).")
            print("Режим дисплея: \(colorViewDesc).")
            print("Громкость: \(currentVolume). ")
        }
    }
}

//Просмотр
var newTelevision = NewTv(currentVideoFormat: .tvChannel, settings: SettingsTV.init(volume: 0.4, isColorView: true))
newTelevision.settings.volume = 1.3

newTelevision.showCurrentChannel()
newTelevision.currentVideoFormat



//Видео порт
var newTelevision2 = NewTv(currentVideoFormat :.videoByPort, settings: SettingsTV.init(volume: 0.4, isColorView: true))
newTelevision2.settings.volume = 0.5
newTelevision2.showCurrentChannel()

newTelevision2.settings.volume = -1
newTelevision2.showCurrentChannel()

newTelevision2.settings.volume = 8
newTelevision2.showCurrentChannel()
