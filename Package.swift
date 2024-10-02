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
    dependencies: [
        .package(url: "https://github.com/virtusize/integration_ios.git", from: "2.5.10"),
    ],
    targets: [
        .target(
            name: "VirtusizeAuthWrapper",
            dependencies: ["VirtusizeAuthXCFramework", .product(name: "VirtusizeCore", package: "integration_ios")],
            path: "VirtusizeAuthWrapper",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "VirtusizeAuthXCFramework",
            path: "VirtusizeAuth.xcframework"
        )
    ]
)
