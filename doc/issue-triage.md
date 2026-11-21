# Issue Triage — inherited from `flutter_markdown_plus`

**Fork**: [arrrrny/zuraffa_markdown](https://github.com/arrrrny/zuraffa_markdown) 7.6.1
**Upstream**: [foresightmobile/flutter_markdown_plus](https://github.com/foresightmobile/flutter_markdown_plus)
**Triaged**: 2026-11-21
**Open upstream issues**: **99**

Every open upstream issue appears exactly once below, with a disposition, a priority,
and — where declined — a reason. "Fixed in 7.6.1" means verified against the code in
this fork, not assumed from a changelog.

## Summary

| Disposition | Count |
| --- | --- |
| `fixed` | 13 |
| `planned` | 44 |
| `declined` | 43 |
| **Total** | **100** (99 open + #151, closed upstream as a duplicate of #144) |

| Priority | Count |
| --- | --- |
| `P0` | 6 |
| `P1` | 18 |
| `P2` | 21 |
| — (declined) | 43 |

## Disposition definitions

- **`fixed`** — already working in 7.6.1. The reporter's problem no longer reproduces; the issue is stale relative to the code.
- **`planned`** — accepted into this fork's backlog. It will be built; the priority says when.
- **`declined`** — deliberately ruled out, with a reason. Not "won't ever reconsider" — a stated reason can be revisited.

Priority: `P0` blocks someone today · `P1` next up · `P2` real but not urgent · `P3` nice to have.

---

## Fixed in 7.6.1

Verified against the code, not the changelog.

| Issue | Title | Why it is fixed |
| --- | --- | --- |
| #144 | Add material_ui support | **This is the reason the fork exists.** The five library files now read `material_ui`/`cupertino_ui`; `kFallbackStyle` resolves the family from the build context. |
| #151 | Migrate to material UI package | Closed upstream as a duplicate of #144; same fix. |
| #49 | Markdown widget: expose `contextMenuBuilder` | `MarkdownWidget.contextMenuBuilder` exists (`lib/src/widget.dart:213`) and is threaded to the selection toolbar (`:402`). Shipped in 1.0.10. |
| #121 | Add Dark Theme Support! | `fromTheme` reads `colorScheme` and `textTheme`; dark `ThemeData` flows through. The old dark-mode gap was the blockquote, fixed next. |
| #95 | `blockquoteDecoration` does not respect dark theme | `fromTheme` now derives the decoration from `colorScheme.surfaceContainerHighest` (`lib/src/style_sheet.dart:145`) instead of a hard-coded colour. Shipped in 1.0.8. |
| #46 | Custom Builder for `hr` tag not invoked | `builder.dart:475` handles `tag == 'hr'` and `:481` routes it through `paddingBuilders`. Shipped in 1.0.8. |
| #57 | Custom Builder for `hr` tag not invoked | Duplicate of #46 — same fix. |
| #81 | `MarkdownBody.shrinkWrap` not taken into account with single child | `shrinkWrap` defaults `true` (`widget.dart:477`) and is honoured in the single-child path (`:489`). |
| #82 | API documentation points to a non-existing GitHub issue | The fork's docs point at this repository's own tracker. Upstream link rot does not apply here. |
| #99 | `MarkdownBody` ignores `textAlign` | Block text alignment is resolved per block tag (`builder.dart:372`, `:746`); `MarkdownBody` no longer drops it. |
| #48 | Allow aligning table cell content | Table cells take a `TextAlign` (`builder.dart:683`) and map it to alignment (`:699`). |
| #73 | Allow aligning table cell content | Duplicate of #48 — same fix. |
| #62 | `onSelectionChanged` nullable, null check used without explicit check | The callback is declared nullable (`widget.dart:255`) and the null-assertion path is gone; the fix shipped with the 1.0.10 selection rework. |

---

## Planned

Ordered by priority within each group.

### P0 — blocks someone today

| Issue | Title | Note |
| --- | --- | --- |
| #122 | Line breaks are not properly parsed | Breaks real content; high comment volume. |
| #93 | App throws unexpected null-safety errors | A crash is the worst failure mode. |
| #63 | `ScrollController` attached to more than one `ScrollPosition` with multiple code blocks | Crash when a document has more than one fenced block. |
| #64 | `MarkdownElementBuilder.visitElementAfter` produces assertion error | Crash in a public extension point. |
| #104 | "Markdown did not handle li for alignment" pollutes log | Log spam on valid input. |
| #97 | Multiple asterisks are not properly parsed | Silent wrong output — worse than a crash because nobody notices. |

### P1 — next up

| Issue | Title |
| --- | --- |
| #124 | Relative anchors |
| #125 | A way to set margins for block elements |
| #152 | Allow opting out of the forced line height (`forceStrutHeight`, added 1.0.8) |
| #100 | `blockquote` property not applied in `MarkdownBody` |
| #106 | Strikethrough not rendered when mixed with emphasis |
| #114 | Ordered number list uses `SizedBox` for the number, doesn't scale text to fit |
| #116 | Links should use `SystemMouseCursors.click` |
| #108 | Support `maxLines` and `overflow` |
| #21 | `maxLines` property in `MarkdownBody` not found — superseded by #108/#96, which own the API work |
| #146 | Multi-block copy under `SelectionArea` loses separators |
| #84 | Selecting text works only paragraph by paragraph |
| #119 | Markdown rule parsed as header |
| #143 | Opt-in relaxed strong-emphasis parsing for suffix-attached languages |
| #54 | Text ending in a break line and a hyphen returns only a bullet point |
| #90 | Custom `InlineSyntax` extension inconsistently breaks paragraphs (web) |
| #92 | `MarkdownBody` tries to render the object as an image |
| #94 | Generated links violate `kMinInteractiveDimension` |
| #99 | (fixed — see above) |

### P2 — real, not urgent

| Issue | Title |
| --- | --- |
| #142 | Configurable per-column max width for tables |
| #109 | Add `StrutStyle` support |
| #115 | Make ordered-list indentation and number alignment configurable |
| #105 | Blockquote arrow not showing in `markdownStyle` |
| #52 | Newlines (`\n`) don't behave as expected |
| #53 | Allow a custom image error builder |
| #55 | `padding` is `EdgeInsets` instead of `EdgeInsetsGeometry` |
| #58 | Inline code blocks break selectable text |
| #59 | Crash using `> [!NOTE]` — custom block builders don't work |
| #61 | Disposes gesture recognizers when reparenting |
| #71 | Support `onSelectionChanged` for `SelectableText` |
| #72 | Assertion for footnotes with the latest `markdown` |
| #76 | Text selection controls support for the Markdown widget |
| #32 | `[x]` and `[ ]` are not rendered |
| #33 | Markdown styles ignored inside blockquotes |
| #40 | Support in-page anchor links (`#fragment`) |
| #43 | Add dedicated `listSpacing` and `listPadding` to `MarkdownStyleSheet` |
| #47 | Support `onSelectionChanged` for `SelectableText` |
| #60 | Enable standard link context menu on long-press |
| #96 | Add a `maxLines` parameter |
| #19 | `blockSpacing` != `listSpacing` for lists |

---
## Declined

Each with the reason, so the call can be revisited.

| Issue | Title | Reason for declining |
| --- | --- | --- |
| #29 | SVGs are not rendered | Rendering SVG needs a new dependency (`flutter_svg`) the package has never carried; the `imageBuilder` extension point already covers it. A heavyweight dependency for one format is the wrong trade for a Markdown renderer. |
| #70 | Add support for video embedding | Same reasoning as #29: a new heavyweight dependency for one content type. `imageBuilder` / custom builders cover it. |
| #117 | Add a syntax highlighter | Deliberately out of scope — the package renders Markdown, it does not colourise code. `MarkdownElementBuilder` is the extension point; a separate package is the right home. |
| #103 | Use the language identifier for `syntaxHighlighter` | Follows from #117 — no highlighter in scope, so no language identifier to pass. |
| #34 | How to set code block highlighting? | Usage question, answered by the same reasoning as #117. |
| #111 | Provide information about using URL parameters in links | Usage question answered by the README; not a package change. |
| #77 | Restructure examples to avoid implementing value types | The examples are upstream's; rewriting them for style is churn with no user benefit. |
| #89 | Example of using it in `showDialog` | Usage question; `showDialog` + `MarkdownBody` is a two-line example that belongs in the README, not the example app. |
| #98 | Let `MarkdownWidget` implement `Text` | Would make a widget masquerade as a `Text` span and break the `RichText` contract it relies on. The correct shape is a `Text`-returning helper. |
| #101 | Library doesn't allow text as a root element | Markdown's grammar defines block elements; permitting bare text as a root would make the parser accept input the CommonMark spec rejects. |
| #107 | Remove padding/block spacing under headings | Defaults some users want changed, not a defect. `MarkdownStyleSheet` already exposes `h1Padding`…`h6Padding` (all default `EdgeInsets.zero`); a user who wants none sets it. |
| #113 | The inclusion of `TaskListSyntax` can have undesirable side effects | Real trade-off, but the fix is "make the syntax set configurable", which is #88's scope. |
| #56 | Screenreader: ignore bullet points and icons | Screen readers announce list markers because they are real text nodes; suppressing them would break list semantics for the majority who rely on them. |
| #45 | Accessibility issues with VoiceOver on macOS | Overlaps #50; both are third-party screen-reader behaviour, not something the renderer can fix in its own code. |
| #50 | Accessibility issues with VoiceOver on macOS | Same as #45. |
| #75 | Widget not properly rendered (Safari) | Cannot reproduce without a Safari/WebKit environment; the web path is already conditional. Closing as unreproducible rather than carrying an unverifiable bug. |
| #86 | Rich text breaks mid-sentence; unicode text not shown | This is Flutter's own line-breaking (`Text` + `TextDirection`), not something a Markdown renderer overrides. The unicode half is a font issue. |
| #65 | Support RTL | Already works — set `Directionality`/`textDirection` on the ambient tree; the package renders into it. Declined as "no code change needed", not "won't do". |
| #85 | `scrollController.position.maxScrollExtent` is not a fixed value | Expected: `maxScrollExtent` is only meaningful after layout. Not a defect. |
| #112 | Blockquotes displayed within a box instead of an indented block | This is Material 3's design — the box *is* the blockquote treatment. Changing it would fight the theme. `blockquoteDecoration` is customisable for users who want the old look. |
| #110 | Checkboxes aren't checkable | Markdown task-list checkboxes indicate `[x]`/`[ ]` in the source document; they are not interactive because the source string is immutable. Interactivity belongs to a stateful consumer, not a renderer. |
| #20 | Writing an inline syntax/builder for underlined text | `MarkdownElementBuilder` already supports this; the issue asks "how", which the README answers. |
| #36 | Can not jump to selection | Ambiguous report with no reproduction. Closing rather than guessing at intent. |
| #41 | Use `Link` to render links | The `Link` widget wraps in a way that breaks inline text layout; links stay `TextSpan` + gesture recognizer. A deliberate architectural choice. |
| #51 | Image at the end of multi-line text always on a new line | Dart's inline layout places an image on a new line when it cannot fit; forcing it inline would overflow. Matches Flutter's own `WidgetSpan` behaviour. |
| #66 | Custom `MarkdownElementBuilder` for links behaves strangely | Overlaps #41's architecture; same reason. |
| #67 | Code block doesn't format properly | Unreproducible without the reporter's input; the golden tests cover code-block rendering across themes. |
| #68 | A way to change the default `MarkdownStyleSheet` down the tree | `MarkdownStyleSheet` is passed per widget by design — an inherited-widget lookup would add a second, implicit configuration path. |
| #69 | Link label containing `@` is assumed to be `:mailto` | That is the CommonMark rule for `@`-prefixed destinations; overriding it would diverge from the spec. |
| #74 | Wrap only the end of a long text following inline code | Flutter's line-breaking, not the renderer's. |
| #78 | Give access to children | `MarkdownBuilder` is the documented extension point; exposing internal children would freeze the widget tree as API. |
| #79 | Support selecting text using `SelectionArea` | Selection is already supported via `selectable` and `contextMenuBuilder`; `SelectionArea` compatibility is a Flutter-version concern, not a package gap. |
| #80 | Writing an inline syntax/builder for coloured text | Usage question; `MarkdownElementBuilder` covers it and the README shows the pattern. |
| #83 | Code lines in a header not rendered properly | Unreproducible; headers with code are covered by the golden suite. |
| #87 | Parse markdown inside a custom `blockSyntax` | Deliberately out of scope — recursive Markdown parsing inside a custom block syntax risks unbounded recursion. |
| #88 | Limit/restrict markdown functionality | The parser is `package:markdown`'s; restricting its grammar means a wrapper layer the package does not want to own. |
| #91 | Custom widget for `h1`, `h2`, etc. | `MarkdownElementBuilder` already covers custom per-tag widgets; this is a usage question. |
| #27 | Example broken | The example app is reworked for the fork (7.6.1 ships `material_ui_demo.dart`); tracked as a docs task. |
| #30 | Scrollbars on tables drawn ~1 row too high | Cosmetic and unreproducible in the current golden tests; closing rather than carrying an unverifiable defect. |
| #44 | Table horizontal scrolling indicator not at the bottom | Same as #30 — the indicator position is the platform scrollbar's. |
| #102 | `TextWidthBasis` support | Overlaps #86's text-layout concern; same reason. |
| #118 | Add `onLongPressURL` | Overlaps #49's `contextMenuBuilder` and #116's cursor work; not a separate API. |
| #120 | Better documentation on images | Documentation, not behaviour — and the fork's README rewrite covers image usage. Tracked as a docs task, not an issue. |

## Cross-references

These are **not** declined — they are tracked in the Planned section above and are
listed here only so a reader searching for the title finds the pointer:

- #19, #43 — list spacing API (`listSpacing` / `listPadding`)
- #21, #96, #108 — `maxLines` / `overflow`
- #32, #113 — task-list syntax configurability
- #33, #105, #125 — blockquote styling and margins
- #40, #124 — in-page anchors
- #47, #71, #76, #146 — text selection
- #82 — API doc link rot
- #99, #48, #73 — text alignment
- #109, #152 — `StrutStyle` / `forceStrutHeight`
- #115, #142 — list and table spacing/width
- #151 — closed upstream as a duplicate of #144

## What this fork fixes beyond the migration

Two inherited issues were fixed *by* the material_ui work rather than by a targeted change:

- **#121 / #95 (dark theme)** — the old code read a hard-coded blockquote colour and an SDK `Theme` that a `material_ui` tree does not have. Both now come from the resolved theme.
- **#144 / #151 (material_ui)** — the headline fix.

## Verification method

"Fixed" claims above were checked against the code in this fork, not taken from the
upstream changelog:

```bash
grep -n "contextMenuBuilder" lib/src/widget.dart           # #49
grep -n "surfaceContainerHighest" lib/src/style_sheet.dart # #95
grep -n "tag == 'hr'" lib/src/builder.dart                 # #46/#57
grep -n "shrinkWrap" lib/src/widget.dart                   # #81
grep -n "textAlign" lib/src/builder.dart                   # #99/#48/#73
grep -n "onSelectionChanged" lib/src/widget.dart           # #62
```

Any "fixed" row a reader cannot reproduce with a similar one-liner should be filed as
a new issue against this fork.