//
//  ContentView.swift
//  STKAudioKitInstrumentsDemo
//
//  Created by Ugur Bozkurt on 01/02/2024.
//

import SwiftUI
import Keyboard

struct ContentView: View {
    @StateObject var conductor = Conductor()

    func noteOn(pitch: Pitch, point: CGPoint) {
        conductor.play(midiNote: pitch.midiNoteNumber.magnitude)
    }

    func noteOff(pitch: Pitch) {
        print("note off \(pitch)")
    }

    var body: some View {
        VStack(spacing: 20) {
            List{
                Picker("Select an instrument", selection: $conductor.selectedInstrument) {
                    ForEach(Instrument.allCases) { instrument in
                        Text(instrument.rawValue.capitalized)
                    }
                }

                Button("Stop") {
                    conductor.stop()
                }
                .buttonStyle(.borderedProminent)

            }
            Keyboard(layout: .piano(pitchRange: Pitch(48)...Pitch(82)),
                     noteOn: noteOn,
                     noteOff: noteOff)
            .frame(height: 100)
        }
        .padding()
        .navigationTitle("Instrument")
        .onAppear {
            conductor.start()
        }
        .onDisappear {
            conductor.stop()
        }
    }
}

#Preview {
    ContentView()
}
