// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "VirtusizeAuth",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "VirtusizeAuth",
            targets: ["VirtusizeAuthWrapper"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VirtusizeAuthWrapper",
            dependencies: ["VirtusizeAuthXCFramework"],
            path: "VirtusizeAuthWrapper",
            resources: [.process("Resources/PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "VirtusizeAuthXCFramework",
            path: "VirtusizeAuth.xcframework"
        )
    ]
)
