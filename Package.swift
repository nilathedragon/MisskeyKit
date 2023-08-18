// swift-tools-version:5.9
//
//  Package.Swift
//  MisskeyKit
//
import PackageDescription

let package = Package(
    name: "MisskeyKit",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(name: "MisskeyKit", targets: ["MisskeyKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "MisskeyKit",
            dependencies: ["Starscream"],
            path: "MisskeyKit",
            resources: [.copy("emojilist.json")]
        )
    ]
)
