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
            name: "YMKit",
            path: "YMKit"
        ),
        .testTarget(
            name: "YMKitTests",
            dependencies: ["YMKit"],
            path: "YMKitTests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
