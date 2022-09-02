import AudioKit
import AudioKitEX
import AudioKitUI
import STKAudioKit
import SwiftUI

struct ContentView: View {
    @StateObject var conductor = ShakerConductor()

    func name(noteNumber: MIDINoteNumber) -> String {
        let str = "\(ShakerType(rawValue: noteNumber)!)"
        return str.titleCase()
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(conductor.data.isPlaying ? "Stop" : "Start").onTapGesture {
                    conductor.data.isPlaying.toggle()
                }
                VStack {
                    Text("Tempo: \(Int(conductor.data.tempo))")
                    Slider(value: $conductor.data.tempo, in: 60.0 ... 240.0, label: {
                        Text("Tempo")
                    })
                }

                VStack {
                    Stepper("Downbeat: \(name(noteNumber: conductor.data.downbeatNoteNumber))", onIncrement: {
                        if conductor.data.downbeatNoteNumber <= 21 {
                            conductor.data.downbeatNoteNumber += 1
                        }
                    }, onDecrement: {
                        if conductor.data.downbeatNoteNumber >= 1 {
                            conductor.data.downbeatNoteNumber -= 1
                        }
                    })
                    Stepper("Other beats: \(name(noteNumber: conductor.data.beatNoteNumber))", onIncrement: {
                        if conductor.data.beatNoteNumber <= 21 {
                            conductor.data.beatNoteNumber += 1
                        }
                    }, onDecrement: {
                        if conductor.data.beatNoteNumber >= 1 {
                            conductor.data.beatNoteNumber -= 1
                        }
                    })
                }

                VStack {
                    Text("Velocity")
                    Slider(value: $conductor.data.beatNoteVelocity, in: 0.0 ... 127.0, label: {
                        Text("Velocity")
                    })
                }
            }
            Spacer()

            HStack(spacing: 10) {
                ForEach(0 ..< conductor.data.timeSignatureTop, id: \.self) { index in
                    ZStack {
                        Circle().foregroundColor(conductor.data.currentBeat == index ? .red : .white)
                        Text("\(index + 1)").foregroundColor(.black)
                    }.onTapGesture {
                        conductor.data.timeSignatureTop = index + 1
                    }
                }
                ZStack {
                    Circle().foregroundColor(.white)
                    Text("+").foregroundColor(.black)
                }
                .onTapGesture {
                    conductor.data.timeSignatureTop += 1
            }
        }

        FFTView(conductor.reverb)
        }
        .navigationTitle("Shaker")
        .onAppear {
            conductor.start()
        }
        .onDisappear {
            conductor.stop()
        }
    }
}
