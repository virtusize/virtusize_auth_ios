// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VirtusizeAuth",
    platforms: [
        .iOS(.v13),
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
        .target(
            name: "VirtusizeAuthWrapper",
            dependencies: ["VirtusizeAuth"],
            path: "VirtusizeAuthWrapper",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]
        )
    ]
)
