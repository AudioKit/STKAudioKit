//: ## Clarinet
//: Physical model of a Clarinet
import AudioKit
import Foundation
import PlaygroundSupport
import STKAudioKit

let playRate = 2.0

let clarinet = Clarinet()

let reverb = Reverb(clarinet)

let scale = [0, 2, 4, 5, 7, 9, 11, 12]

let engine = AudioEngine()
engine.output = reverb
try! engine.start()

let t = Timer.scheduledTimer(withTimeInterval: 1.0 / playRate, repeats: true) { _ in
    var note = scale.randomElement()!
    let octave = (2 ..< 6).randomElement()! * 12
    if (0 ... 10).randomElement()! < 1 { note += 1 }
    if !scale.contains(note % 12) { Log("ACCIDENT!") }

    if (0 ... 6).randomElement()! > 1 {
        clarinet.trigger(note: MIDINoteNumber(note + octave), velocity: 127)
    } else {
        clarinet.stop()
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
