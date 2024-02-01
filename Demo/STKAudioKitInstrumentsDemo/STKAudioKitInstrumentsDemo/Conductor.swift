//
//  Conductor.swift
//  STKAudioKitInstrumentsDemo
//
//  Created by Ugur Bozkurt on 01/02/2024.
//

import AudioKit
import AudioKitEX
import STKAudioKit
import SwiftUI

final class Conductor: ObservableObject, HasAudioEngine {
    let engine = AudioEngine()

    @Published var selectedInstrument: Instrument = .plucked

    private lazy var mixer: Mixer = {
        Mixer(Instrument.nodes.map(\.value))
    }()

    init() {
        engine.output = mixer
    }

    func play(midiNote: UInt8) {
        selectedInstrument.node.trigger(note: midiNote)
    }

    func stop() {
        selectedInstrument.node.stop()
    }
}
