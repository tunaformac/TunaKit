# TunaKit

TunaKit is the framework for building extensions and themes for
[Tuna](https://tunaformac.com), the macOS launcher.

It is distributed as a compiled, signed XCFramework via Swift Package Manager;
this repository holds the package manifest and changelog, and each release
carries the binary artifact.

## Installation

```swift
// Package.swift
dependencies: [
  .package(url: "https://github.com/tunaformac/TunaKit", from: "1.10.0")
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
        categories: ["Utilities"],
        iconName: "sparkles"
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

Documentation, guides, and real first-party extension source live at:

- Docs: https://tunaformac.com/docs
- Example extensions: https://github.com/tunaformac/TunaExtensions

## Stability

TunaKit is in beta (SemVer 0.x-style policy on the 1.x line): breaking API
changes can land in minor releases and are called out in
[CHANGELOG.md](CHANGELOG.md). A stability commitment comes with 2.0.

## License

The TunaKit binary is © Brainbow and free to use for building Tuna extensions
and themes.
