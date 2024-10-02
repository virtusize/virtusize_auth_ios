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
            targets: ["VirtusizeAuthXCFramework"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "VirtusizeAuthXCFramework",
            path: "VirtusizeAuth.xcframework"
        ),
        .target(
            name: "VirtusizeAuthWrapper",
            dependencies: ["VirtusizeAuthXCFramework"],
            path: "VirtusizeAuthWrapper",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]
        )
    ]
)
