//
//  STKAudioKitInstrumentsDemoApp.swift
//  STKAudioKitInstrumentsDemo
//
//  Created by Ugur Bozkurt on 01/02/2024.
//

import SwiftUI
import AVFoundation

@main
struct STKAudioKitInstrumentsDemoApp: App {
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
