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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.19.0/TunaKit-1.19.0.xcframework.zip",
      checksum: "033e92f2ae4174a8e72ac5f6acf6d8db59fdf1de8f9964ee36e3ce027e912686"
    )
  ]
)
