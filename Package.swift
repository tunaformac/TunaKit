// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "TunaKit",
  platforms: [.macOS(.v15)],
  products: [
    .library(name: "TunaKit", targets: ["TunaKit"])
  ],
  targets: [
    .binaryTarget(
      name: "TunaKit",
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.17.0/TunaKit-1.17.0.xcframework.zip",
      checksum: "54e38b65f15428d5d52b15a2ccd69a3b93b2e0eb66d169ef234ce43650a856da"
    )
  ]
)
