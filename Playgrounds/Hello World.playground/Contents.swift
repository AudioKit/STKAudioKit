//: Simple Playground to test if STKAudioKit is working 
import AudioKit
import STKAudioKit
import Foundation

let shaker = Shaker()

let engine = AudioEngine()
engine.output = shaker

try! engine.start()

while true {
    let type = ShakerType(rawValue: (0...22).randomElement()!)!
    print(type)
    shaker.trigger(type: type)
    sleep(1)
}
