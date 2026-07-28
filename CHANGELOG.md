# TunaKit Changelog

TunaKit is in beta: breaking API changes can land in minor releases (1.x → 1.y)
and are called out here. A stability commitment comes with 2.0.

## 1.14.0

- Extension declaration validation now rejects default and preferred action references whose
  action IDs are absent from their declared action catalogs.

## 1.13.0

- **Breaking:** catalogs are now two sibling kinds. `Catalog` vends `objects` and
  is a *source*: it feeds subject and target search, carries a search priority,
  and is listed in Sources. The new `ActionCatalog` vends
  `actions: [CatalogAction]` and is none of those things. It is not a refinement
  of `Catalog`, so a catalog that mixes items and actions can no longer be
  written. See ADR 0006.
- **Breaking:** `ExtensionDeclaration` gains `actionCatalogs: [ActionCatalogDeclaration]`.
  Action catalogs must be declared there, never in `catalogs`. `catalogs` now
  defaults to `[]`, so an extension may contribute only actions. Both kinds share
  one identifier namespace.
- **Breaking:** `appActionEnrichments` and `defaultActionRankings` must reference
  action catalogs. Naming a source catalog is a declaration error.
- **Breaking:** app action enrichment is purely additive. Naming an action
  catalog for an app no longer removes it from anywhere else — it only orders it
  for that app. Where an action applies is decided solely by
  `supportedSubjectTypes` and `subjectPredicate`. Extensions that mirrored their
  actions through a search catalog to work around the old behavior should delete
  the mirroring.
- Action catalogs have no scan lifecycle: no `scan()`, no `reportScanFinished()`,
  no retained-state release. They are built from an `ActionCatalogDefinition`,
  which carries only an identifier and a name — no enablement, advanced flag, or
  settings. A setting that configures a verb belongs in the extension's own
  `settings`.
- Added `ActionAvailabilityProviding`, for an action that cannot run under
  current conditions — its app is not installed, a permission was refused, it has
  nothing to operate on. Unavailable actions are filtered wherever actions are
  matched to a subject. This replaces the scan-to-empty signal that action
  catalogs no longer have. It is read during search, so keep it cheap.

- Added `MainWindow.playTransition(_:duration:animations:finalState:completion:)`
  and `MainWindow.AnimationDirection`. Themes that need their own show/hide
  animations can now add them to the content layer while TunaKit keeps owning
  the transition lifecycle: superseding an in-flight transition, the
  `animationsEnabled` bypass, and ordering the window out after a hide.
  `playShowAnimations` and `playHideAnimations` are wrappers over it and keep
  their signatures; `playHideAnimations` now orders the window out itself when
  the hide completes, so themes no longer have to.

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
