//
//  Instrument.swift
//  STKAudioKitInstrumentsDemo
//
//  Created by Ugur Bozkurt on 01/02/2024.
//

import STKAudioKit
import Foundation

enum Instrument: String, Hashable, CaseIterable, Identifiable {
    var id: Self { self }

    case plucked, mandolin, flute

    static var nodes: [Instrument: STKBase] = [
        .plucked: Plucked(),
        .mandolin: MandolinString(),
        .flute: Flute()
    ]

    var node: STKBase {
        Self.nodes[self]!
    }
}
