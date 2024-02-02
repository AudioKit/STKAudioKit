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

    case blowHole, brass, clarinet, flute, mandolin, plucked, rhodesPianoKey, sax, shaker, tubularBells, stifKarp, sitar

    static var nodes: [Instrument: STKBase] = [
        .blowHole: BlowHole(),
        .brass: Brass(),
        .clarinet: Clarinet(),
        .flute: Flute(),
        .mandolin: MandolinString(),
        .plucked: Plucked(),
        .rhodesPianoKey: RhodesPianoKey(),
        .sax: Saxofony(),
        .shaker: Shaker(),
        .tubularBells: TubularBells(),
        .stifKarp: StifKarp(),
        .sitar: Sitar()
    ]

    var node: STKBase {
        Self.nodes[self]!
    }
}
