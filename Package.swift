// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Assets",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Assets",
            targets: ["Assets"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/leviouwendijk/FileTypes.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "Assets",
            dependencies: [
                .product(name: "FileTypes", package: "FileTypes"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
