// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "TimelineSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "TimelineSDK",
            targets: ["TimelineSDK"]
        ),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "TimelineSDK",
            dependencies: [],
            path: "TimelineSDK",
            exclude: ["Resources"]
        ),
        .testTarget(
            name: "TimelineSDKTests",
            dependencies: ["TimelineSDK"],
            path: "TimelineSDKTests"
        ),
    ]
)
