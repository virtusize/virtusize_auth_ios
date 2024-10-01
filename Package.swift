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
        .target(
            name: "VirtusizeAuthorization",
            dependencies: ["VirtusizeAuth"],
            path: "VirtusizeAuth",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "VirtusizeAuth",
            path: "VirtusizeAuth/VirtusizeAuth.xcframework"
        ),
    ]
)
