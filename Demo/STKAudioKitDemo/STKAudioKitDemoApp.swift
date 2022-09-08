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
