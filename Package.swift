// swift-tools-version:5.4

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
            name: "YMKit",
            dependencies: ["YMFormatter", "YMKitInfo"]
        ),
        .target(name: "YMFormatter"),
        .target(name: "YMKitInfo"),
        .testTarget(
            name: "YMKitTests",
            dependencies: ["YMKit"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
