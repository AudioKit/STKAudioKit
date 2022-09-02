import AudioKit
import AudioKitEX
import AudioKitUI
import STKAudioKit
import SwiftUI

struct ShakerMetronomeData {
    var isPlaying = false
    var tempo: BPM = 120
    var timeSignatureTop: Int = 4
    var downbeatNoteNumber = MIDINoteNumber(6)
    var beatNoteNumber = MIDINoteNumber(10)
    var beatNoteVelocity = 100.0
    var currentBeat = 0
}

class ShakerConductor: ObservableObject, HasAudioEngine {
    let engine = AudioEngine()
    let shaker = Shaker()
    var callbackInst = CallbackInstrument()
    let reverb: Reverb
    let mixer = Mixer()
    var sequencer = Sequencer()

    @Published var data = ShakerMetronomeData() {
        didSet {
            data.isPlaying ? sequencer.play() : sequencer.stop()
            sequencer.tempo = data.tempo
            updateSequences()
        }
    }

    func updateSequences() {
        var track = sequencer.tracks.first!

        track.length = Double(data.timeSignatureTop)

        track.clear()
        track.sequence.add(noteNumber: data.downbeatNoteNumber, position: 0.0, duration: 0.4)
        let vel = MIDIVelocity(Int(data.beatNoteVelocity))
        for beat in 1 ..< data.timeSignatureTop {
            track.sequence.add(noteNumber: data.beatNoteNumber, velocity: vel, position: Double(beat), duration: 0.1)
        }

        track = sequencer.tracks[1]
        track.length = Double(data.timeSignatureTop)
        track.clear()
        for beat in 0 ..< data.timeSignatureTop {
            track.sequence.add(noteNumber: MIDINoteNumber(beat), position: Double(beat), duration: 0.1)
        }
    }

    init() {
        let fader = Fader(shaker)
        fader.gain = 20.0

        //        let delay = Delay(fader)
        //        delay.time = AUValue(1.5 / playRate)
        //        delay.dryWetMix = 0.7
        //        delay.feedback = 0.2
        reverb = Reverb(fader)

        _ = sequencer.addTrack(for: shaker)

        callbackInst = CallbackInstrument(midiCallback: { _, beat, _ in
            self.data.currentBeat = Int(beat)
            print(beat)
        })

        _ = sequencer.addTrack(for: callbackInst)
        updateSequences()

        mixer.addInput(reverb)
        mixer.addInput(callbackInst)

        engine.output = mixer
    }
}
