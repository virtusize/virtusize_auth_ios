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
            targets: ["VirtusizeAuthorization"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VirtusizeAuthorization",
            dependencies: ["VirtusizeAuthFramework", "VirtusizeCoreFramework"],
            path: "Resources",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "VirtusizeAuthFramework",
            path: "VirtusizeAuth.xcframework"
        ),
        .binaryTarget(
            name: "VirtusizeCoreFramework",
            path: "VirtusizeCore.xcframework"
        )
    ]
)
