# Issue Triage — inherited from `flutter_markdown_plus`

**Fork**: [arrrrny/zuraffa_markdown](https://github.com/arrrrny/zuraffa_markdown) 7.6.1
**Upstream**: [foresightmobile/flutter_markdown_plus](https://github.com/foresightmobile/flutter_markdown_plus)
**Triaged**: 2026-11-21
**Upstream issues**: **106** (99 open, 7 closed)
**Imported as**: **87** canonical issues, with 19 upstream duplicates folded in

Every upstream issue is now tracked in this repository. Duplicates were folded into
a single canonical issue rather than imported separately; the canonical's body lists
the upstream numbers it covers, so the original discussion stays reachable.

## Summary

| Disposition | Upstream issues | Fork issues |
| --- | --- | --- |
| `fixed` | 12 | 12 |
| `planned` | 40 | 40 |
| `declined` | 35 | 35 |
| **Total** | **106** | **87** |

Priorities on planned work:

| Priority | Fork issues |
| --- | --- |
| `P0` | 6 |
| `P1` | 18 |
| `P2` | 16 |

## Disposition definitions

- **`fixed`** — already working in a published version. Verified against the code, not the changelog.
- **`planned`** — accepted into this fork's backlog; the priority says when.
- **`declined`** — deliberately ruled out, with a reason recorded on the issue so the call can be revisited.

## Fixed

Verified against the code in this fork.

| Fork | Upstream | Issue |
| --- | --- | --- |
| [#11](https://github.com/arrrrny/zuraffa_markdown/issues/11) | #46 | Custom Builder for 'hr' Tag Not Invoked |
| [#13](https://github.com/arrrrny/zuraffa_markdown/issues/13) | #48 | Allow aligning table cell content |
| [#20](https://github.com/arrrrny/zuraffa_markdown/issues/20) | #58 | inline code blocks break selectable text |
| [#22](https://github.com/arrrrny/zuraffa_markdown/issues/22) | #60 | Enable standard link context menu on long-press. |
| [#23](https://github.com/arrrrny/zuraffa_markdown/issues/23) | #61 | Disposes gesture recognizers when reparenting |
| [#24](https://github.com/arrrrny/zuraffa_markdown/issues/24) | #62 | onSelectionChanged is nullable, null check operator is used without explicit null check |
| [#33](https://github.com/arrrrny/zuraffa_markdown/issues/33) | #72 | throws assertion for footnotes with latest `markdown` |
| [#41](https://github.com/arrrrny/zuraffa_markdown/issues/41) | #81 | MarkdownBody.shrinkWrap not taken into account with single child |
| [#42](https://github.com/arrrrny/zuraffa_markdown/issues/42) | #82 | API documentation points to a non-existing GitHub issue |
| [#57](https://github.com/arrrrny/zuraffa_markdown/issues/57) | #99 | MarkdownBody ignores textAligment property |
| [#77](https://github.com/arrrrny/zuraffa_markdown/issues/77) | #121 | Add Dark Theme Support! |
| [#87](https://github.com/arrrrny/zuraffa_markdown/issues/87) | #144 | Add material_ui support |

## Planned

Ordered by priority.


### P0 — blocks someone today

| Fork | Upstream | Issue |
| --- | --- | --- |
| [#25](https://github.com/arrrrny/zuraffa_markdown/issues/25) | #63 | FlutterError (The provided ScrollController is currently attached to more than one ScrollPosition.) when having multiple ` ``` ``` ` blocks |
| [#26](https://github.com/arrrrny/zuraffa_markdown/issues/26) | #64 | MarkdownElementBuilder.visitElementAfter produces assertion error |
| [#53](https://github.com/arrrrny/zuraffa_markdown/issues/53) | #93 | App throws unexpected null-safety errors |
| [#55](https://github.com/arrrrny/zuraffa_markdown/issues/55) | #97 | multiple asterisks are not properly parsed |
| [#61](https://github.com/arrrrny/zuraffa_markdown/issues/61) | #104 | "Markdown did not handle li for alignment" pollutes log |
| [#78](https://github.com/arrrrny/zuraffa_markdown/issues/78) | #122 | Line breaks are not properly parsed |

### P1 — next up

| Fork | Upstream | Issue |
| --- | --- | --- |
| [#10](https://github.com/arrrrny/zuraffa_markdown/issues/10) | #45 | accessibility issues with VoiceOver on MacOS |
| [#12](https://github.com/arrrrny/zuraffa_markdown/issues/12) | #47 | Support onSelectionChanged for SelectableText |
| [#17](https://github.com/arrrrny/zuraffa_markdown/issues/17) | #54 | Markdown Parsing Error: Text that ends with a break line and a hyphen returns only a bullet point |
| [#44](https://github.com/arrrrny/zuraffa_markdown/issues/44) | #84 | Selecting text works only paragraph by paragraph in markdown widget when text is not indented |
| [#50](https://github.com/arrrrny/zuraffa_markdown/issues/50) | #90 | Custom Markdown InlineSyntax extension inconsistently breaks paragraphs [Web] |
| [#52](https://github.com/arrrrny/zuraffa_markdown/issues/52) | #92 | MarkdownBody tries to render the object as an image |
| [#54](https://github.com/arrrrny/zuraffa_markdown/issues/54) | #94 | MarkdownBody widgets generate links which violate kMinInteractiveDimension |
| [#58](https://github.com/arrrrny/zuraffa_markdown/issues/58) | #100 | `blockquote` property not being applied in `MarkdownBody`  widget |
| [#62](https://github.com/arrrrny/zuraffa_markdown/issues/62) | #106 | Strikethrough Tags Not Correctly Rendered When Mixed with Emphasis and Order Changes |
| [#64](https://github.com/arrrrny/zuraffa_markdown/issues/64) | #108 | Support `maxLines` and `overflow` |
| [#70](https://github.com/arrrrny/zuraffa_markdown/issues/70) | #114 | Ordered number list uses SizedBox for bullet number, but doesn't scale text to fit properly |
| [#72](https://github.com/arrrrny/zuraffa_markdown/issues/72) | #116 | Update the rendering of links to include SystemMouseCursors.click |
| [#75](https://github.com/arrrrny/zuraffa_markdown/issues/75) | #119 | Markdown rule parsed as header |
| [#80](https://github.com/arrrrny/zuraffa_markdown/issues/80) | #124 | Relative anchors |
| [#81](https://github.com/arrrrny/zuraffa_markdown/issues/81) | #125 | Please provide a way to set margins for block elements |
| [#86](https://github.com/arrrrny/zuraffa_markdown/issues/86) | #143 | opt-in relaxed strong emphasis parsing for suffix-attached languages |
| [#88](https://github.com/arrrrny/zuraffa_markdown/issues/88) | #146 | Multi-block copy under SelectionArea loses separators (flutter/flutter#104548) — verified ~45-line fix the package could adopt |
| [#89](https://github.com/arrrrny/zuraffa_markdown/issues/89) | #152 | Allow opting out of the forced line height (StrutStyle forceStrutHeight) added in 1.0.8 |

### P2 — real, not urgent

| Fork | Upstream | Issue |
| --- | --- | --- |
| [#4](https://github.com/arrrrny/zuraffa_markdown/issues/4) | #19 | blockSpacing != listSpacing for Lists |
| [#6](https://github.com/arrrrny/zuraffa_markdown/issues/6) | #27 | example broken |
| [#15](https://github.com/arrrrny/zuraffa_markdown/issues/15) | #52 | New lines (`\n`) do not behave as expected. |
| [#16](https://github.com/arrrrny/zuraffa_markdown/issues/16) | #53 | Allow specifying a custom image error builder |
| [#18](https://github.com/arrrrny/zuraffa_markdown/issues/18) | #55 | padding is EdgeInsets instead of EdgeInsetsGeometry |
| [#21](https://github.com/arrrrny/zuraffa_markdown/issues/21) | #59 | Crash if using `> [!NOTE]` syntax because custom block builders do not work |
| [#29](https://github.com/arrrrny/zuraffa_markdown/issues/29) | #67 | code block doesn't format properly |
| [#32](https://github.com/arrrrny/zuraffa_markdown/issues/32) | #70 | Add support for video embedding |
| [#36](https://github.com/arrrrny/zuraffa_markdown/issues/36) | #76 | Add text selection controls support to Markdown widget |
| [#39](https://github.com/arrrrny/zuraffa_markdown/issues/39) | #79 | Support selecting text using `SelectionArea` |
| [#65](https://github.com/arrrrny/zuraffa_markdown/issues/65) | #109 | Add StrutStyle support |
| [#68](https://github.com/arrrrny/zuraffa_markdown/issues/68) | #112 | Blockquotes are displayed within a box instead of indented block of text |
| [#69](https://github.com/arrrrny/zuraffa_markdown/issues/69) | #113 | The Inclusion of TaskListSyntax Can Have Undesirable Side-effects |
| [#71](https://github.com/arrrrny/zuraffa_markdown/issues/71) | #115 | Make 4 pixel indentation and text alignment for ordered numbers lists customizable |
| [#73](https://github.com/arrrrny/zuraffa_markdown/issues/73) | #117 | Add Syntax Highlighter |
| [#85](https://github.com/arrrrny/zuraffa_markdown/issues/85) | #142 | configurable per-column max width for tables (avoid overly wide columns on mobile) |

## Declined

Each issue carries its reason, so the call can be revisited.

| Fork | Upstream | Issue |
| --- | --- | --- |
| [#3](https://github.com/arrrrny/zuraffa_markdown/issues/3) | #15 | Add support for Latex |
| [#5](https://github.com/arrrrny/zuraffa_markdown/issues/5) | #26 | Needs a demo on how to change font size, spacing, padding etc. |
| [#7](https://github.com/arrrrny/zuraffa_markdown/issues/7) | #29 | SVGs are not rendered |
| [#8](https://github.com/arrrrny/zuraffa_markdown/issues/8) | #30 | Scrollbars on tables are drawn ~1 row too high |
| [#9](https://github.com/arrrrny/zuraffa_markdown/issues/9) | #36 | Can not jump to selection |
| [#14](https://github.com/arrrrny/zuraffa_markdown/issues/14) | #51 | For multi-line text with an image at the end - the image is always on a new line |
| [#19](https://github.com/arrrrny/zuraffa_markdown/issues/19) | #56 | Screenreader: Ignore Bullet Points and Icons |
| [#27](https://github.com/arrrrny/zuraffa_markdown/issues/27) | #65 | Support RTL |
| [#28](https://github.com/arrrrny/zuraffa_markdown/issues/28) | #66 | strange behavior with custom MarkdownElementBuilder for links ('a' tag) |
| [#30](https://github.com/arrrrny/zuraffa_markdown/issues/30) | #68 | Add a way to change the default `MarkdownStyleSheet` down the widget tree |
| [#31](https://github.com/arrrrny/zuraffa_markdown/issues/31) | #69 | Any link label containing '@' is assumed to have a destination using :mailto |
| [#34](https://github.com/arrrrny/zuraffa_markdown/issues/34) | #74 | Wrap only the end of a long text following an inline code element in Markdown |
| [#35](https://github.com/arrrrny/zuraffa_markdown/issues/35) | #75 | [Safari] Markdown widget is not properly rendered |
| [#37](https://github.com/arrrrny/zuraffa_markdown/issues/37) | #77 | Restructure flutter_markdown examples to avoid implementing values types |
| [#38](https://github.com/arrrrny/zuraffa_markdown/issues/38) | #78 | give access to children |
| [#40](https://github.com/arrrrny/zuraffa_markdown/issues/40) | #80 | Writing an inline sytax/builder for colored text |
| [#43](https://github.com/arrrrny/zuraffa_markdown/issues/43) | #83 | code lines in header not rendered properly |
| [#45](https://github.com/arrrrny/zuraffa_markdown/issues/45) | #85 | "scrollController.position.maxScrollExtent"  is not a fixed value |
| [#46](https://github.com/arrrrny/zuraffa_markdown/issues/46) | #86 | rich text breaks in the middle of a whole sentence, and unicode text not shown. |
| [#47](https://github.com/arrrrny/zuraffa_markdown/issues/47) | #87 | Parse markdown inside custom blockSyntax |
| [#48](https://github.com/arrrrny/zuraffa_markdown/issues/48) | #88 | limit/restrict markdown functionality |
| [#49](https://github.com/arrrrny/zuraffa_markdown/issues/49) | #89 | Please add example how to use in showDialog |
| [#51](https://github.com/arrrrny/zuraffa_markdown/issues/51) | #91 | Feature Request: Custom Widget for h1, h2 etc. |
| [#56](https://github.com/arrrrny/zuraffa_markdown/issues/56) | #98 | Let MarkdownWidget implement Text |
| [#59](https://github.com/arrrrny/zuraffa_markdown/issues/59) | #101 | Library doesn't allow text as root element |
| [#60](https://github.com/arrrrny/zuraffa_markdown/issues/60) | #102 | `TextWidthBasis` support |
| [#63](https://github.com/arrrrny/zuraffa_markdown/issues/63) | #107 | Remove padding/blockspacing under headings |
| [#66](https://github.com/arrrrny/zuraffa_markdown/issues/66) | #110 | Checkboxes aren't checkable |
| [#67](https://github.com/arrrrny/zuraffa_markdown/issues/67) | #111 | Provide Information About Using URL Parameters In Links |
| [#74](https://github.com/arrrrny/zuraffa_markdown/issues/74) | #118 | Add onLongPressURL |
| [#76](https://github.com/arrrrny/zuraffa_markdown/issues/76) | #120 | Better Documentation on Images |
| [#79](https://github.com/arrrrny/zuraffa_markdown/issues/79) | #123 | [Documentation]: Add samples, examples for `onTapLink`, `styleSheets` |
| [#82](https://github.com/arrrrny/zuraffa_markdown/issues/82) | #129 | Markdown parsing error: bold syntax ** fails when preceded by a closing parenthesis ） |
| [#83](https://github.com/arrrrny/zuraffa_markdown/issues/83) | #132 | MarkdownElementBuilder replaces only first child when builder returns a widget for inline elements |
| [#84](https://github.com/arrrrny/zuraffa_markdown/issues/84) | #133 | Is this package still being maintained ? There are no new releases in the last 5 months? |

## How to read an imported issue

Every imported issue's body carries:

- a backlink to the upstream issue it came from
- the upstream duplicates folded into it, if any
- its disposition and, for planned work, its priority
- the reasoning — including, for declined work, why it was ruled out

## Verification

The import was checked to be a complete partition of the upstream backlog:

```
upstream issues:            106
referenced in the fork:     106
missing:                    0
```

Run it yourself:

```bash
gh issue list --repo arrrrny/zuraffa_markdown --state all --limit 300 \
  --json number,body --jq '[.[].body] | join("\n")' \
  | grep -oE 'flutter_markdown_plus/issues/[0-9]+' | sort -u
```
