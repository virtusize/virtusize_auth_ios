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
            targets: ["VirtusizeAuthWrapper"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VirtusizeAuthWrapper",
            dependencies: ["VirtusizeAuthXCFramework"],
            path: "VirtusizeAuthWrapper",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "VirtusizeAuthXCFramework",
            path: "VirtusizeAuth.xcframework"
        )
    ]
)
