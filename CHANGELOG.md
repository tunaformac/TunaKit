# TunaKit Changelog

TunaKit is in beta: breaking API changes can land in minor releases (1.x → 1.y)
and are called out here. A stability commitment comes with 2.0.

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
