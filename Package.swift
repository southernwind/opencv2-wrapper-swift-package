// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenCvWrapper",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OpenCvWrapper",
            targets: ["OpenCvWrapper"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/southernwind/opencv2-swift-package.git",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "OpenCvWrapperObjC",
            dependencies: ["opencv2-swift-package"],
            sources: ["src"],
            publicHeadersPath: "include",
            cSettings: [.headerSearchPath("include")]
        ),
        .target(
            name: "OpenCvWrapper"),
        .testTarget(
            name: "OpenCvWrapperTests",
            dependencies: ["OpenCvWrapper"]),
    ]
)
