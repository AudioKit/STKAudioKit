// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "STKAudioKit",
    platforms: [.macOS(.v10_13), .iOS(.v11), .tvOS(.v11)],
    products: [.library(name: "STKAudioKit", targets: ["STKAudioKit"])],
    dependencies: [
        .package(url: "https://github.com/AudioKit/AudioKit", from: "5.3.0"),
        .package(url: "https://github.com/AudioKit/AudioKitEX", from: "5.3.0"),
    ],
    targets: [
        .target(name: "Stk", exclude: ["LICENSE"], resources: [.copy("rawwaves")]),
        .target(name: "STKAudioKit", dependencies: ["AudioKit", "AudioKitEX", "CSTKAudioKit", "Stk"]),
        .target(name: "CSTKAudioKit", dependencies: ["AudioKit", "AudioKitEX", "Stk"]),
        .testTarget(name: "STKAudioKitTests", dependencies: ["STKAudioKit"]),
    ],
    cxxLanguageStandard: .cxx14
)
