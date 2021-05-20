import AVFoundation
import XCTest

extension XCTestCase {
    func testMD5(_ buffer: AVAudioPCMBuffer) {
        let localMD5 = buffer.md5
        let name = self.description
        XCTAssert(validatedMD5s[name] == buffer.md5, "\nFAILEDMD5 \"\(name)\": \"\(localMD5)\",")
    }
}

let validatedMD5s: [String: String] = [
    "-[ClarinetTest testClarinet]": "1db0a9fa9901af443d404e7e18676cc0",
    "-[ClarinetTest testVelocity]": "26efd42f23e15319228f423373cac169",
    "-[FluteTests testFlute]": "264beca825da812550d7b7b06fbaf3ee",
    "-[FluteTests testVelocity]": "f8596d2c7dedccd52c0b60adc4d84821",
    "-[MandolinStringTests testAmplitude]": "6eb67e5c2defc9e1e51c1df6f9310d60",
    "-[MandolinStringTests testMandolin]": "f219d8ba04a3cc19c4235c651ecc9367",
    "-[RhodesPianoKeyTests testAmplitude]": "d349565cae5618b5d6326f20623d8ea5",
    "-[RhodesPianoKeyTests testRhodesPiano]": "7341d6c60e58433aa7992ee080c297c4",
    "-[ShakerTests testShaker]": "709fbb05ec97f539079dd77e8c96bc4d",
    "-[ShakerTests testShakerAmplitude]": "57b501c34d5b4114ff8b1464a6842103",
    "-[ShakerTests testShakerType]": "998478fb4c871a653b296033d2318f4e",
    "-[TubularBellsTests testAmplitude]": "3c14777a9e2c94336b7dc349b5ccefc3",
    "-[TubularBellsTests testTubularBells]": "dc87914ab7836f859709c3d84df1d4e5",
]
