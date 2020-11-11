// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "YMKit",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "YMKit",
            targets: ["YMKit"]
        )
    ],
    targets: [
        .target(
            name: "YMKit"
        ),
        .testTarget(
            name: "YMKitTests",
            dependencies: ["YMKit"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
