// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The minimal use case that proves the point of this fork: rendering Markdown
/// inside an application built entirely on `material_ui` — with no SDK `Theme`
/// ancestor anywhere in the tree.
///
/// Run it with `flutter run -t lib/material_ui_demo.dart`.
library;

import 'package:material_ui/material_ui.dart';
import 'package:zuraffa_markdown/zuraffa_markdown.dart';

void main() {
  runApp(const MaterialUiDemo());
}

/// A `material_ui` application that renders Markdown.
///
/// Note the import: `package:material_ui/material_ui.dart` brings its own
/// `Theme`, `ThemeData`, `Scaffold` and `MaterialApp` — and exports
/// `package:flutter/widgets.dart` on top of them. There is no
/// `package:flutter/material.dart` import here, so no SDK `Theme` ancestor
/// exists in this tree. `zuraffa_markdown` resolves the fork family from the
/// build context and derives its fallback style sheet from the theme below.
class MaterialUiDemo extends StatelessWidget {
  /// Creates the demo application.
  const MaterialUiDemo({super.key});

  /// The Markdown document rendered by this demo — every supported construct.
  static const String _markdown = '''
# material_ui

This document is rendered by **`zuraffa_markdown`** inside a tree built on
`material_ui` — with no SDK `Theme` ancestor.

## Constructs

A paragraph with *emphasis*, **strong**, ~~strikethrough~~ and `inline code`.

> A blockquote, decorated from the material_ui theme.

- unordered item
- another item

1. ordered item
2. another ordered item

- [x] a completed task
- [ ] an open task

| Feature | Status |
| ------- | ------ |
| material_ui | works |
| cupertino_ui | works |

---

```dart
void main() => runApp(const MaterialUiDemo());
```

[Zuraffa](https://zuraffa.com)
''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zuraffa_markdown on material_ui',
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('zuraffa_markdown on material_ui')),
        body: const Markdown(data: _markdown),
      ),
    );
  }
}
