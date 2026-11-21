# zuraffa_markdown
[![pub package](https://img.shields.io/pub/v/zuraffa_markdown.svg)](https://pub.dartlang.org/packages/zuraffa_markdown)

## About This Package

`zuraffa_markdown` is a fork of [`flutter_markdown_plus`](https://pub.dev/packages/flutter_markdown_plus), which is itself the continuation of the original [`flutter_markdown`](https://pub.dev/packages/flutter_markdown) package developed and maintained by Google. The upstream project has gone quiet — its last release was in July 2026, and its [issue tracker](https://github.com/foresightmobile/flutter_markdown_plus/issues) has accumulated a large backlog with no maintainer response.

The fork exists to fix one blocking defect and keep the package moving: **it renders correctly inside an application built on [`material_ui`](https://pub.dev/packages/material_ui)**, the Flutter team's replacement for the SDK's bundled Material library. Flutter 3.47 deprecated `package:flutter/material.dart`, so every application that follows that guidance needs a Markdown renderer that reads the new theme family.

The package is **actively maintained**: bug reports are triaged against the current release, community pull requests are reviewed and merged with credit, and fixes and additive features ship regularly. See the [changelog](https://pub.dev/packages/zuraffa_markdown/changelog) and [`CONTRIBUTING.md`](CONTRIBUTING.md) if you'd like to help.

### Why this fork exists

Upstream imports `package:flutter/material.dart` in five library files, and its fallback style generator calls `Theme.of(context)` **unconditionally** on every parse. On an application whose tree is built on `material_ui` there is no SDK `Theme` ancestor to find — so the package cannot render at all, and passing a complete `styleSheet` does not help, because the fallback is computed before the caller's sheet is merged over it.

See [upstream issue #144](https://github.com/foresightmobile/flutter_markdown_plus/issues/144) for the full analysis.

### Inherited capabilities

Upstream's recent work is carried forward unchanged:

### Recent highlights

- **`contextMenuBuilder`** — customise or suppress the text-selection toolbar shown when `selectable` is enabled (1.0.10).
- **`noScroll`** — render `Markdown` in a non-scrolling `Column` for embedding inside an existing scroll view (1.0.8).
- **Theme-aware blockquotes** — default blockquote styling now adapts to light and dark themes (1.0.8).
- **Correct inline formatting in blockquotes**, consistent line height across mixed font weights, and custom `builders`/`paddingBuilders` support for the `hr` tag (1.0.8).
- **Integration test suite** running on a real device or emulator, plus a GitHub Actions job on an Android emulator (1.0.8).

For historical context, see the [original flutter_markdown package](https://pub.dev/packages/flutter_markdown).

## Features

- **GitHub Flavored Markdown** by default — headings, bold/italic, strikethrough, blockquotes, lists, and horizontal rules.
- **Tables** with customisable borders, cell alignment, and per-column widths.
- **Task lists** rendered as checkboxes.
- **Fenced and inline code** with independent per-block horizontal scrolling and selection highlighting.
- **Links** with a tap callback, and **images** from the network, local files, or bundled assets.
- **Footnotes** and **emoji** (Unicode or `:shortcode:` syntax).
- **Text selection** with `onSelectionChanged`, a tap handler, and a customisable selection toolbar via `contextMenuBuilder`.
- **Three widgets** for different layouts: scrollable `Markdown`, inline `MarkdownBody`, and unstyled `MarkdownRaw`.
- **Deep styling** through `MarkdownStyleSheet`, plus **custom element and padding builders** for full control over rendering.
- **`noScroll`** mode to embed rendered Markdown inside an existing scroll view.
- Runs on **Android, iOS, web, macOS, Windows, and Linux**.

## Screenshots

| Rich text & formatting | Tables & task lists | Code blocks |
| :---: | :---: | :---: |
| ![Rich text and formatting](screenshots/formatting.png) | ![Tables and task lists](screenshots/tables.png) | ![Code blocks](screenshots/code.png) |

## Installation

Add the package to your project:

```bash
flutter pub add zuraffa_markdown
```

Then import it where you need it:

```dart
import 'package:zuraffa_markdown/zuraffa_markdown.dart';
```

A markdown renderer for Flutter. It supports the
[original format](https://daringfireball.net/projects/markdown/), but no inline
HTML.

### Migrating from `zuraffa_markdown`

Change the dependency name and version, and the import. Nothing else:

```diff
-  zuraffa_markdown: ^1.0.12
+  zuraffa_markdown: ^7.6.1
```

```diff
-import 'package:zuraffa_markdown/zuraffa_markdown.dart';
+import 'package:zuraffa_markdown/zuraffa_markdown.dart';
```

The public API is unchanged: every class, constructor, named parameter and default
value keeps its name, type and meaning.

### Rendering on a `material_ui` application

`zuraffa_markdown` reads whichever theme family is present in the tree. On an
application built on `material_ui` — with no SDK `Theme` ancestor anywhere — the
fallback style sheet is derived from the `material_ui` theme:

```dart
import 'package:material_ui/material_ui.dart';
import 'package:zuraffa_markdown/zuraffa_markdown.dart';

MaterialApp(
  theme: ThemeData(brightness: Brightness.light),
  home: Scaffold(
    body: Markdown(data: '# Hello

A **bold** statement.'),
  ),
)
```

Applications still on the SDK's `MaterialApp` keep working unchanged.

## Overview

The [`zuraffa_markdown`](https://pub.dev/packages/zuraffa_markdown) package
renders Markdown, a lightweight markup language, into a Flutter widget
containing a rich text representation.

`zuraffa_markdown` is built on top of the Dart
[`markdown`](https://pub.dev/packages/markdown) package, which parses
the Markdown into an abstract syntax tree (AST). The nodes of the AST are an
HTML representation of the Markdown data.

## Flutter Isn't an HTML Renderer

While this approach to creating a rich text representation of Markdown source
text in Flutter works well, Flutter isn't an HTML renderer like a web browser.
Markdown was developed by John Gruber in 2004 to allow users to turn readable,
plain text content into rich text HTML. This close association with HTML allows
for the injection of HTML into the Markdown source data. Markdown parsers
generally ignore hand-tuned HTML and pass it through to be included in the
generated HTML. This *trick* has allowed users to perform some customization
or tweaking of the HTML output. A common HTML tweak is to insert HTML line-break
elements **\<br />** in Markdown source to force additional line breaks not
supported by the Markdown syntax. This HTML *trick* doesn't apply to Flutter. The
`zuraffa_markdown` package doesn't support inline HTML.

## Markdown Specifications and `zuraffa_markdown` Compliance

There are three seminal documents regarding Markdown syntax; the
[original Markdown syntax documentation](https://daringfireball.net/projects/markdown/syntax) 
specified by John Gruber, the
[CommonMark specification](https://spec.commonmark.org/0.29/), and the
[GitHub Flavored Markdown specification](https://github.github.com/gfm/).

The CommonMark specification brings order to and clarifies the Markdown syntax
cases left ambiguous or unclear in the Gruber document. GitHub Flavored
Markdown (GFM) is a strict superset of CommonMark used by GitHub.

The `markdown` package, and in extension, the `zuraffa_markdown` package, supports
four levels of Markdown syntax; basic, CommonMark, GitHub Flavored, and GitHub
Web. Basic, CommonMark, and GitHub Flavored adhere to the three Markdown
documents, respectively. GitHub Web adds header ID and emoji support. The
`zuraffa_markdown` package defaults to GitHub Flavored Markdown.

## Getting Started

Using the Markdown widget is simple, just pass in the source markdown as a
string:

<?code-excerpt "example/lib/readme_excerpts.dart (CreateMarkdown)"?>
```dart
const Markdown(data: markdownSource);
```

If you do not want the padding or scrolling behavior, use the MarkdownBody
instead:

<?code-excerpt "example/lib/readme_excerpts.dart (CreateMarkdownBody)"?>
```dart
const MarkdownBody(data: markdownSource);
```

By default, Markdown uses the formatting from the current material design theme,
but it's possible to create your own custom styling. Use the MarkdownStyle class
to pass in your own style. If you don't want to use Markdown outside of material
design, use the MarkdownRaw class.

### Choosing a widget

| Widget | Use it when |
| --- | --- |
| `Markdown` | You want a standalone, scrollable view of the content. |
| `MarkdownBody` | You want to embed rendered Markdown inside your own layout; it sizes itself to its content. |
| `MarkdownRaw` | You want the rendering without Material theming. |

To render inside an existing scroll view (for example a `CustomScrollView` or a
`Column` in a `SingleChildScrollView`), use `Markdown` with `noScroll: true` so it
lays out as a non-scrolling `Column` instead of managing its own scrolling.

## Handling Links

Markdown links are not followed automatically — you decide what a tap does.
Provide an `onTapLink` callback and open the URL yourself, for example with the
[`url_launcher`](https://pub.dev/packages/url_launcher) package:

```dart
Markdown(
  data: '[Flutter](https://flutter.dev)',
  onTapLink: (String text, String? href, String title) {
    if (href != null) {
      launchUrl(Uri.parse(href));
    }
  },
);
```

## Styling

Pass a `MarkdownStyleSheet` to restyle any element. The easiest approach is to
start from the current theme and override only what you need with `copyWith`:

```dart
MarkdownBody(
  data: markdownSource,
  styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
    h1: Theme.of(context).textTheme.headlineMedium,
    code: const TextStyle(
      fontFamily: 'monospace',
      backgroundColor: Color(0x11000000),
    ),
    blockquotePadding: const EdgeInsets.all(12),
  ),
);
```

## Custom Rendering

For full control over how a specific tag renders, supply a
`MarkdownElementBuilder` through the `builders` map, and fine-tune spacing with
`paddingBuilders`. This lets you swap in your own widgets for elements such as
`code`, `a`, or custom tags. See the [`example/`](example/) app for working
custom-builder demos.

## Selection

By default, Markdown is not selectable. A caller may use the following ways to
customize the selection behavior of Markdown:

* Set `selectable` to true, and use `onTapText` and `onSelectionChanged` to
  handle tapping and selecting events.
* Set `selectable` to false, and wrap Markdown with [`SelectionArea`](https://api.flutter.dev/flutter/material/SelectionArea-class.html) or [`SelectionRegion`](https://api.flutter.dev/flutter/widgets/SelectableRegion-class.html).

## Emoji Support

Emoji glyphs can be included in the formatted text displayed by the Markdown
widget by either inserting the emoji glyph directly or using the inline emoji
tag syntax in the source Markdown document.

Markdown documents using UTF-8 encoding can insert emojis, symbols, and other
Unicode characters directly in the source document. Emoji glyphs inserted
directly in the Markdown source data are treated as text and preserved in the
formatted output of the Markdown widget. For example, in the following Markdown
widget constructor, a text string with a smiley face emoji is passed in as the
source Markdown data.

<?code-excerpt "example/lib/readme_excerpts.dart (CreateMarkdownWithEmoji)"?>
```dart
Markdown(
  controller: controller,
  selectable: true,
  data: 'Insert emoji here😀 ',
);
```

The resulting Markdown widget will contain a single line of text with the
emoji preserved in the formatted text output.

The second method for including emoji glyphs is to provide the Markdown
widget with a syntax extension for inline emoji tags. The Markdown
package includes a syntax extension for emojis, EmojiSyntax. The default
extension set used by the Markdown widget is the GitHub flavored extension
set. This pre-defined extension set approximates the GitHub supported
Markdown tags, providing syntax handlers for fenced code blocks, tables,
auto-links, and strike-through. To include the inline emoji tag syntax
while maintaining the default GitHub flavored Markdown behavior, define
an extension set that combines EmojiSyntax with ExtensionSet.gitHubFlavored.

<?code-excerpt "example/lib/readme_excerpts.dart (CreateMarkdownWithEmojiExtension)"?>
```dart
import 'package:markdown/markdown.dart' as md;
// ···
  Markdown(
    controller: controller,
    selectable: true,
    data: 'Insert emoji :smiley: here',
    extensionSet: md.ExtensionSet(
      md.ExtensionSet.gitHubFlavored.blockSyntaxes,
      <md.InlineSyntax>[
        md.EmojiSyntax(),
        ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
      ],
    ),
  );
```

## Image Support

The `Img` tag only supports the following image locations:

* From the network: Use a URL prefixed by either `http://` or `https://`.

* From local files on the device: Use an absolute path to the file, for example by
  concatenating the file name with the path returned by a known storage location,
  such as those provided by the [`path_provider`](https://pub.dartlang.org/packages/path_provider)
  plugin.

* From image locations referring to bundled assets: Use an asset name prefixed by `resource:`.
  like `resource:assets/image.png`.

## Verifying Markdown Behavior

Verifying Markdown behavior in other applications can often be useful to track
down or identify unexpected output from the `zuraffa_markdown` package. Two
valuable resources are the
[Dart Markdown Live Editor](https://dart-lang.github.io/markdown/) and the
[Markdown Live Preview](https://markdownlivepreview.com/). These two resources
are dynamic, online Markdown viewers.

## Markdown Resources

Here are some additional Markdown syntax resources:

- [Markdown Guide](https://www.markdownguide.org/)
- [CommonMark Markdown Reference](https://commonmark.org/help/)
- [GitHub Guides - Mastering Markdown](https://guides.github.com/features/mastering-markdown/#GitHub-flavored-markdown)
  - [Download PDF cheatsheet version](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf)

## Maintainers

Upstream was maintained by [Gareth Reese](https://github.com/gazreese) and [Marko Radisavljevic](https://github.com/Prototypev1) for [Foresight Mobile](https://foresightmobile.com/).

This fork is maintained by the Zuraffa project. Please file issues at
[arrrrny/zuraffa_markdown](https://github.com/arrrrny/zuraffa_markdown/issues) — the
upstream tracker is not monitored.
