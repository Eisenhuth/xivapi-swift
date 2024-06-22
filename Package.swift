// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "xivapi-swift",
    platforms: [.iOS(.v16), .macOS(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "xivapi-swift",
            targets: ["xivapi-swift"]),
    ],
    targets: [
        .target(
            name: "xivapi-swift",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
