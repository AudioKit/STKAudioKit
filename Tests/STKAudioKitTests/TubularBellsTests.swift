// Copyright AudioKit. All Rights Reserved.
#if !os(tvOS)

import AudioKit
import XCTest
import STKAudioKit

class TubularBellsTests: XCTestCase {

    func testTubularBells() {
        let engine = AudioEngine()
        let bells = TubularBells()
        bells.trigger(note: 69)
        engine.output = bells
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testAmplitude() {
        let engine = AudioEngine()
        let bells = TubularBells()
        bells.trigger(note: 69, velocity: 64)
        engine.output = bells
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

}
#endif
