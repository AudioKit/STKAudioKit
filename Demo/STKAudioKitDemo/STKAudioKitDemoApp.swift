import AudioKit
import AVFoundation
import SwiftUI

@main
struct STKAudioKitDemoApp: App {
    init() {
        #if os(iOS)
            do {
                try AVAudioSession.sharedInstance().setCategory(.playAndRecord,
                                                                options: [.defaultToSpeaker, .mixWithOthers, .allowBluetoothA2DP])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch let err {
                print(err)
            }
        #endif
    }

    var body: some Scene {
        WindowGroup {
            ContentView().padding()
        }
    }
}

protocol HasAudioEngine {
    var engine: AudioEngine { get }
}

extension HasAudioEngine {
    func start() {
        do { try engine.start() } catch let err { Log(err) }
    }

    func stop() {
        engine.stop()
    }
}
