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
    dependencies: [
        .package(url: "https://github.com/virtusize/integration_ios.git", from: "2.5.10")
    ],
    targets: [
        .target(
            name: "VirtusizeAuthorization",
            dependencies: [
                "VirtusizeAuthFramework", .product(name: "VirtusizeCore", package: "integration_ios")
            ],
            path: "Resources",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "VirtusizeAuthFramework",
            path: "VirtusizeAuth.xcframework"
        )
    ]
)
