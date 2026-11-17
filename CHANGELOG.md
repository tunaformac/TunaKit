# TunaKit Changelog

TunaKit is in beta: breaking API changes can land in minor releases (1.x → 1.y)
and are called out here. A stability commitment comes with 2.0.

## 1.23.0

- `.secret` connections can declare extra `fields` (`CatalogSettingDefinition` strings, option
  pickers, and Booleans). Tuna's connection editor shows them and stores the values in the new
  `ExtensionConnectionRecord.fieldValues`; read them with `fieldValue(for:)` and
  `boolFieldValue(for:)`. The original `ExtensionConnectionDefinition` initializers remain
  available, and records saved by earlier versions load with no field values.
- Added `ThemeDictationPaneStatus` and `DictationOverlayState.paneStatus` to share compact pane
  badges and placeholder text without changing the existing overlay or theme scene APIs.
- Host-projected `ThemeScene` now presents results or the inline Combo cheatsheet exclusively:
  `results` is nil (and `resultsVisible` false) while `comboCheatsheet` is present. Existing public
  properties and initializer entry points remain available.
- Added `ResultsViewStyle.headerPlacement` and `headerFont` so themes can put the results header
  below the list and size its text.
- Added the `iconFitsVisibleBounds` environment value: `IconView` then scales image icons by their
  opaque pixels, so app icons with built-in transparent margins line up with full-bleed artwork.
- Preserved the original `ResultRowStyle` and styled `ResultRow` initializer entry points so
  already-built themes can use the expanded framework without rebuilding.
- Added `ResultRowFonts`, `ResultRowStyle.fonts`, and `ResultRowStyle.leadingDecoration` so
  themes can restyle result rows and draw per-row index labels (`ResultRowDecorationContext`).
  `ResultRow.index` supplies the row position, and `ResultsList` passes it automatically.
- Dynamic items can implement `ActionConfigurationTypeProviding` so command builders offer actions
  for every concrete type they may resolve to without resolving live data during configuration;
  single-type `ActionSubjectResolving` items use their existing type automatically.
- Shortcut items now inherit directly from entity instead of package, so filesystem-only actions
  are no longer offered for Shortcuts app records.
- Added `ScriptCommandMetadata.OutputMode.files` for staging newline-delimited file and folder
  paths returned by scripts.
- Preview providers that opt out of caching are no longer preloaded or shared across concurrent
  display requests, keeping each rendered preview tied to its own load lifecycle.

## 1.22.0

- Added catalog item interaction callbacks for provider analytics when results appear, are
  activated, disappear, or are successfully pasted.
- Added `CatalogAsyncPreviewProviding.cachesAsyncPreview` so providers can opt out of Tuna's
  in-memory preview cache when their content contract prohibits caching.
- Added `CatalogInitialGlobalScope` and `CatalogDeclaration.initialGlobalScope` so extensions can
  keep newly discovered sources out of global search by default.
- Added `CatalogItemPreview.init(animatedImageData:)`. Selected grid items and detail previews now
  play supported animated image formats while other results remain on their first frame.
- Documented `PasteboardDataProviding` and `PasteboardDataRepresentation` as supported public API
  for copying non-text pasteboard flavors.

## 1.21.0

- **Breaking:** `CatalogDeclaration` requires `presentation:` — `.source`,
  `.browseRoot(contents:)`, `.liveSearch`, `.snapshot`, or `.hidden`. The `<id>.search` naming convention no
  longer pairs catalogs; declare a browse root explicitly. A root's contents must be a `.source` or
  `.snapshot` catalog of the same extension and may be claimed by one root only.
  `CatalogDefinition` gains a matching `presentation` (default `.source`).
- Added optional `CatalogDeclaration.description` / `CatalogDefinition.description`, shown under the
  catalog's name in Settings → Sources.
- `BrowseCatalogItem.catalogIcon` (also on the deferred and scoped-search variants) and
  `CatalogIconColor.nsColor` are public, so hosts can reuse a root's symbol and tint.
- Added `ActionResult.cancelled` for user-cancelled actions that should finish quietly without
  entering command history.

## 1.20.0

- Added independent `CatalogItem.searchKeys` matching and match-evidence metadata for result rows.
- Added the `dynamicSearchCatalogEntry` type so provider-backed roots default to Search while
  retaining Browse.
- Expanded theme preview controls and result presentation support.

## 1.19.0

- Add on-demand catalog Quick Look
- Prepare Tuna 0.91 release
- Replace dictation label with timer
- Remove dictation recording limit

## 1.18.0

- **Breaking:** replaced the ambiguous `explicitTextValue()` and `textValueFallback()` helpers
  with purpose-specific primary-content, text-input, automation, copy, and display representations.
  `TextValueProviding` content is preserved exactly instead of being trimmed during extraction.
- **Breaking:** `SolverResultItem.textValue` now returns the unformatted result. Use
  `displayTextValue()` or `copyTextRepresentation()` when locale-aware formatting is wanted.
- Added shared catalog-scan feedback and navigation-affordance symbols for themes.
- `SearchObjectRole` now conforms to `Hashable` for stable role-based SwiftUI identity.
- Corrected `playTransition` visibility to match its non-overridable extension implementation.

## 1.17.0

- **Breaking:** `Runnable.run()`, `RunnableWithInput.run(with:)`, and catalog action callbacks are
  now async. Action callbacks are main-actor isolated.
- **Breaking:** `RunnableWithInput` now requires `acceptsInput`; the separate
  `ShortcutAcceptsInput` marker protocol was removed.
- **Breaking:** `Runnable` and `CommandItem` now declare `executionPolicy` and
  `headlessEligibility`, separating post-command presentation from whether a command may safely run
  without the launcher interface.
- **Breaking:** removed the parallel `AsyncRunnable`, `AsyncCommandItem`, and
  `AsyncActionProviding` APIs, along with runnable presentation hints and result-shape flags. Use
  the unified async APIs and return the actual `ActionResult` instead.
- **Breaking:** removed action initializers that accepted `Void` callbacks, the title-derived
  `CommandItem` initializer, `DefaultActionIdentifier`, `ThemePreviewViewModel`, and the
  `ScoreResult.catalogIdentifier` compatibility spelling. Actions must return an honest result;
  command IDs and result provenance are explicit.
- **Breaking:** `CatalogAction` and `PredicateAwareAction` initializers no longer accept
  `type: .action`; action instances always use `.action`. The raw
  `supportedSubjectTypeIdentifiers` and `allowedTargetTypeIdentifiers` properties were removed;
  use their typed `TypeID` counterparts.
- `AppLog` now exposes stable entry identities and change notifications for live diagnostic views;
  release builds retain a bounded in-memory history of warnings and errors.

## 1.16.1

- Fixed deferred browse entries without an explicit child presentation inheriting their catalog's
  presentation instead of forcing a list.

## 1.16.0

- Added standard eager, deferred, and scoped-search browse entries that automatically make Browse
  their default action.
- Added optional per-hierarchy child presentation to `DeferredBrowseCatalogItem`, allowing lazy
  browse entries to use configured grids.

## 1.15.0

- Added reusable direct OAuth PKCE configuration, callback parsing, and authorization-code token
  exchange APIs. Extension connection declarations can opt in while existing brokered OAuth
  declarations continue to use the Tuna web broker unchanged.
- Added per-hierarchy grid presentation configuration and preview-first grid items, including
  custom column counts, cell sizing, and spacing.
- Added `CatalogLoadingItem` for host-rendered indeterminate loading states.
- Added action target search scopes with optional on-demand loading or per-selection catalog
  refresh, allowing extensions to keep dynamic target collections lazy and current.
- Fixed `TextSnippetItem` identity collisions between snippets sharing the same display title.

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
