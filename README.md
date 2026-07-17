# TunaKit

> [!IMPORTANT]
> This repository describes the extension platform planned for Tuna 0.79. Tuna 0.79 has not been
> released yet; the current public app is Tuna 0.78, so treat the instructions, compatibility
> versions, and examples below as a release preview.

TunaKit is the framework for building extensions and themes for
[Tuna](https://tunaformac.com), the macOS launcher.

It is distributed as a compiled, signed XCFramework via Swift Package Manager;
this repository holds the package manifest and changelog, and each release
carries the binary artifact.

## Installation

```swift
// Package.swift
dependencies: [
  .package(url: "https://github.com/tunaformac/TunaKit", "1.12.0"..<"1.13.0")
]
```

Or add `https://github.com/tunaformac/TunaKit` as a package dependency in
Xcode. Requires macOS 15+.

## Getting started

An extension is an `Extension` subclass that declares its catalogs in Swift:

```swift
import TunaKit

@objc(MyExtension)
public final class MyExtension: Extension {
  public override var declaration: ExtensionDeclaration? {
    ExtensionDeclaration(
      metadata: ExtensionMetadata(
        displayName: "My Extension",
        author: "You",
        description: "Does a thing.",
        iconName: "sparkles"
      ),
      compatibility: ExtensionDeclarationCompatibility(
        minTuna: "0.79",
        minTunaKit: "1.12.0"
      ),
      catalogs: [
        CatalogDeclaration(
          id: "my.catalog",
          type: MyCatalog.self,
          name: "My Catalog",
          enabledByDefault: true
        )
      ]
    )
  }
}
```

Documentation, guides, first-party extension source, and the public starter live at:

- Docs: https://tunaformac.com/docs
- First-party extensions: https://github.com/tunaformac/TunaExtensions
- Extension starter: https://github.com/tunaformac/TunaExtensionTemplate

## Stability

TunaKit is in beta (SemVer 0.x-style policy on the 1.x line): breaking API
changes can land in minor releases and are called out in
[CHANGELOG.md](CHANGELOG.md). A stability commitment comes with 2.0.

## License

TunaKit is proprietary. Copyright © 2026 Mikkel Malmberg. All rights reserved.
The compiled TunaKit binary is free to use for building Tuna extensions and themes.
