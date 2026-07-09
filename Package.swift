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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.11.0/TunaKit-1.11.0.xcframework.zip",
      checksum: "e5830aef876b93db052e3d87830264c343b343d9900b9058e093f4fde94403ed"
    )
  ]
)
