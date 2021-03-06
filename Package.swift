// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VirtusizeAuth",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "VirtusizeAuth",
            targets: ["VirtusizeAuth"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "VirtusizeAuth",
            path: "VirtusizeAuth.xcframework"
        ),
    ]
)