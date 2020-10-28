// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalizationHelper",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LocalizationHelper",
            targets: ["LocalizationHelper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.3.1"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LocalizationHelper",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser"), "SwiftyJSON"],
            resources: [.process("dictionary.json")]
            ),
        .testTarget(
            name: "LocalizationHelperTests",
            dependencies: ["LocalizationHelper"]),
    ]
)
