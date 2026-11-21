import 'package:cupertino_ui/cupertino_ui.dart' as cupertino_ui;
// ignore: deprecated_member_use
import 'package:flutter/cupertino.dart' as sdk_cupertino;
// ignore: deprecated_member_use
import 'package:flutter/material.dart' as sdk;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart' show RichText, InlineSpan;
import 'package:material_ui/material_ui.dart' as mui;
import 'package:zuraffa_markdown/zuraffa_markdown.dart';

String? _leafStyle(WidgetTester tester) {
  final rich = tester.widget<RichText>(find.byType(RichText).first);
  InlineSpan? leaf;
  void walk(InlineSpan s) {
    if (s is sdk.TextSpan) {
      if (s.children == null || s.children!.isEmpty) {
        leaf ??= s;
      }
      for (final c in s.children ?? const <InlineSpan>[]) {
        walk(c);
      }
    }
  }

  walk(rich.text);
  final st = (leaf as sdk.TextSpan?)?.style;
  return st == null ? null : 'size=${st.fontSize} color=${st.color}';
}

void main() => defineTests();

void defineTests() {
  testWidgets('SDK MaterialApp keeps its own theme', (tester) async {
    await tester.pumpWidget(
      sdk.MaterialApp(
        theme: sdk.ThemeData(
          textTheme: const sdk.TextTheme(bodyMedium: sdk.TextStyle(fontSize: 99.0, color: sdk.Color(0xFFFF0000))),
        ),
        home: const sdk.Scaffold(body: Markdown(data: 'plain text')),
      ),
    );
    final s = _leafStyle(tester);
    expect(s, contains('size=99.0'));
    expect(s, contains('red: 1.0000'));
  });

  testWidgets('material_ui app keeps its own theme', (tester) async {
    await tester.pumpWidget(
      mui.MaterialApp(
        theme: mui.ThemeData(
          textTheme: const mui.TextTheme(bodyMedium: mui.TextStyle(fontSize: 42.0, color: mui.Color(0xFF0000FF))),
        ),
        home: const mui.Scaffold(body: Markdown(data: 'plain text')),
      ),
    );
    final s = _leafStyle(tester);
    expect(s, contains('size=42.0'));
    expect(s, contains('blue: 1.0000'));
  });

  testWidgets('SDK CupertinoApp keeps its own theme', (tester) async {
    await tester.pumpWidget(
      sdk_cupertino.CupertinoApp(
        theme: const sdk_cupertino.CupertinoThemeData(
          primaryColor: sdk.Color(0xFF00AA00),
          textTheme: sdk_cupertino.CupertinoTextThemeData(textStyle: sdk.TextStyle(fontSize: 55.0)),
        ),
        home: const sdk_cupertino.CupertinoPageScaffold(
          child: Markdown(data: 'plain text', styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino),
        ),
      ),
    );
    final s = _leafStyle(tester);
    expect(s, contains('size=55.0'));
  });

  testWidgets('material_ui CupertinoTheme keeps its own theme', (tester) async {
    await tester.pumpWidget(
      mui.MaterialApp(
        theme: mui.ThemeData(),
        home: cupertino_ui.CupertinoPageScaffold(
          child: Markdown(data: 'plain text', styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('platform base theme resolves without throwing under either app', (tester) async {
    await tester.pumpWidget(
      sdk.MaterialApp(
        theme: sdk.ThemeData(),
        home: const sdk.Scaffold(
          body: Markdown(data: 'plain text', styleSheetTheme: MarkdownStyleSheetBaseTheme.platform),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  });
}
