// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "CircleView",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "CircleView",
            targets: [
                "CircleView",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.14"))
    ],
    targets: [
        .target(
            name: "CircleView",
            dependencies: [
                .product(name: "ErrorKit", package: "ErrorKit"),
            ]
        ),
        .testTarget(
            name: "CircleViewTests",
            dependencies: [
                "CircleView",
            ]
        ),
    ]
)
