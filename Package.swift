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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.20.0/TunaKit-1.20.0.xcframework.zip",
      checksum: "5023dd904587a6d2547c810d3283db751f99161d30a71bfe126e98e4c171bf82"
    )
  ]
)
