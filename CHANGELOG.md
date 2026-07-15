# TunaKit Changelog

TunaKit is in beta: breaking API changes can land in minor releases (1.x → 1.y)
and are called out here. A stability commitment comes with 2.0.

## 1.12.0

- **Breaking:** `CatalogReference(parsing:)` now accepts only canonical catalog
  IDs and nonempty local item IDs without control characters. Catalog IDs must
  match `[a-z0-9][a-z0-9._-]*`.
- Added `CatalogReference.isCanonicalCatalogID(_:)` and
  `CatalogReference.isCanonicalLocalID(_:)` so extensions can validate stable
  identifiers consistently with Tuna.
- Added `FileSystemCatalog.scanObjectTransformer`, an off-main-thread final
  transformation for complete scan snapshots. Catalogs using it fall back to
  full scans for watcher changes so the transformation receives authoritative
  contents.
- **Breaking:** `TextEditingKeyEquivalentResolver` is now main-actor isolated,
  matching the AppKit window and application state it operates on.
- Current Tuna hosts reject catalog snapshots containing malformed or duplicate
  item IDs and allow dynamic catalogs to recover after a later valid scan.

## 1.11.0

- **Breaking:** `ExtensionMetadata` no longer has a `categories` field — remove
  the `categories:` argument from your declaration. Store categorization is
  curated on the store side instead of self-declared.

## 1.10.0

First release distributed as a public binary package (`tunaformac/TunaKit`).

- **Breaking:** extension manifests are now declared in Swift. The Info.plist
  `TKExtension` dictionary is no longer read; override `Extension.declaration`
  and return an `ExtensionDeclaration` with typed `CatalogDeclaration` entries
  (catalog classes are referenced as metatypes, not strings).
- **Breaking:** `Extension.init(bundle:)` throws if the extension provides no
  declaration.
- Added `ExtensionDeclaration`, `CatalogDeclaration`,
  `ExtensionDeclarationCompatibility`, and typed settings/enrichment/type
  registration definitions.
- Added the `ItemReference` grammar with a stable id/title/searchText core on
  `CatalogItem`.
- Improved fuzzy scoring and highlighted-string rendering.
- Themes are unchanged: theme bundles keep the lazy `TKTheme` Info.plist
  marker.

## 1.6.0

- Added catalog browse icon support and cleaned up catalog icon imports.
- Unified application catalog APIs.
- Improved Nuggets/theme styling hooks, including tint picker and result row states.
- Improved fuzzy mnemonic scoring.
- Added support for actions to skip command history.
- Improved runtime performance by optimizing emoji grid paging and moving watcher event preparation off the main thread.

## 1.5.0

- Previous TunaKit release.
