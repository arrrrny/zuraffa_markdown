// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:js_interop';

import 'package:cupertino_ui/cupertino_ui.dart' as cupertino_ui;
// The SDK Material and Cupertino libraries are deprecated as of Flutter 3.47, but
// applications that have not migrated to `material_ui` still insert their theme
// ancestors, so the package keeps reading them.
// ignore: deprecated_member_use
import 'package:flutter/cupertino.dart' as sdk_cupertino;
// ignore: deprecated_member_use
import 'package:flutter/material.dart' as sdk_material;
import 'package:material_ui/material_ui.dart' as material_ui;
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;

import 'style_sheet.dart';
import 'widget.dart';

/// Type for a function that creates image widgets.
typedef ImageBuilder = Widget Function(Uri uri, String? imageDirectory, double? width, double? height);

/// A default image builder handling http/https, resource, data, and file URLs.
// ignore: prefer_function_declarations_over_variables
final ImageBuilder kDefaultImageBuilder = (Uri uri, String? imageDirectory, double? width, double? height) {
  if (uri.scheme == 'http' || uri.scheme == 'https') {
    return Image.network(uri.toString(), width: width, height: height, errorBuilder: kDefaultImageErrorWidgetBuilder);
  } else if (uri.scheme == 'data') {
    return _handleDataSchemeUri(uri, width, height);
  } else if (uri.scheme == 'resource') {
    return Image.asset(uri.path, width: width, height: height, errorBuilder: kDefaultImageErrorWidgetBuilder);
  } else {
    final Uri fileUri;

    if (imageDirectory != null) {
      try {
        fileUri = Uri.parse(p.join(imageDirectory, uri.toString()));
      } catch (error, stackTrace) {
        // Handle any invalid file URI's.
        return Builder(
          builder: (BuildContext context) {
            return kDefaultImageErrorWidgetBuilder(context, error, stackTrace);
          },
        );
      }
    } else {
      fileUri = uri;
    }

    if (fileUri.scheme == 'http' || fileUri.scheme == 'https') {
      return Image.network(
        fileUri.toString(),
        width: width,
        height: height,
        errorBuilder: kDefaultImageErrorWidgetBuilder,
      );
    } else {
      final String src = p.join(p.current, fileUri.toString());
      return Image.network(src, width: width, height: height, errorBuilder: kDefaultImageErrorWidgetBuilder);
    }
  }
};

/// A default error widget builder for handling image errors.
// ignore: prefer_function_declarations_over_variables
final ImageErrorWidgetBuilder kDefaultImageErrorWidgetBuilder =
    (BuildContext context, Object error, StackTrace? stackTrace) {
      return const SizedBox();
    };

/// A default style sheet generator.
final MarkdownStyleSheet Function(BuildContext, MarkdownStyleSheetBaseTheme?)
// ignore: prefer_function_declarations_over_variables
kFallbackStyle = (BuildContext context, MarkdownStyleSheetBaseTheme? baseTheme) {
  final MarkdownStyleSheet result = switch (baseTheme) {
    MarkdownStyleSheetBaseTheme.platform when _userAgent.toDart.contains('Mac OS X') => _cupertinoStyleSheet(context),
    MarkdownStyleSheetBaseTheme.cupertino => _cupertinoStyleSheet(context),
    _ => _materialStyleSheet(context),
  };

  return result.copyWith(textScaler: MediaQuery.textScalerOf(context));
};

/// Resolves the Material style sheet from whichever theme family the tree has.
///
/// [material_ui]'s `Theme.of` returns its own built-in fallback when it finds no
/// `material_ui` ancestor, so a null check cannot tell the two families apart.
/// The ancestor widget itself is the discriminator: an SDK `MaterialApp` inserts
/// an SDK `Theme`, a `material_ui` app inserts a `material_ui` `Theme`.
MarkdownStyleSheet _materialStyleSheet(BuildContext context) {
  if (context.findAncestorWidgetOfExactType<sdk_material.Theme>() != null) {
    return MarkdownStyleSheet.fromSdkTheme(sdk_material.Theme.of(context));
  }
  return MarkdownStyleSheet.fromTheme(material_ui.Theme.of(context));
}

/// The Cupertino counterpart of [_materialStyleSheet].
MarkdownStyleSheet _cupertinoStyleSheet(BuildContext context) {
  if (context.findAncestorWidgetOfExactType<sdk_cupertino.CupertinoTheme>() != null) {
    return MarkdownStyleSheet.fromSdkCupertinoTheme(sdk_cupertino.CupertinoTheme.of(context));
  }
  return MarkdownStyleSheet.fromCupertinoTheme(cupertino_ui.CupertinoTheme.of(context));
}

Widget _handleDataSchemeUri(Uri uri, double? width, double? height) {
  final String mimeType = uri.data!.mimeType;
  if (mimeType.startsWith('image/')) {
    return Image.memory(
      uri.data!.contentAsBytes(),
      width: width,
      height: height,
      errorBuilder: kDefaultImageErrorWidgetBuilder,
    );
  } else if (mimeType.startsWith('text/')) {
    return Text(uri.data!.contentAsString());
  }
  return const SizedBox();
}

@JS('window.navigator.userAgent')
external JSString get _userAgent;
