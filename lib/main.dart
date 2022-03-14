import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_ui_toolkit/docs.dart';
import 'package:flutter_ui_toolkit/page_factory.design.dart';

import 'data_builders.dart';

Future<void> main() async {
  final themes = {
    'light': ThemeData.light(),
    'dark': ThemeData.dark(),
  };
  runApp(
    DesignSystemViewerApp(
      settings: ViewerSettings(
        enabledLocales: {
          'en-US': const Locale('en', 'US'),
        },
        enabledThemes: themes,
        widgetDisplayHeight: 500,
      ),
      dataBuilders: {
        String: [
          // Need to use a condition here to use the data builder constructor's default value
          ([p]) => p != null && p is String
              ? MyStringDataBuilder(p)
              : MyStringDataBuilder(),
        ]
      },
      branding: Text('Yoo'),
      pageGroups: [
        // Your custom pages
        ...buildGroupedPageTrees(docPages),
        // Theme page
        // buildThemePageGroup(themes: themes),
        // Generated @design/@Design annotated pages
        buildComponentPageTree(componentPages: generatedComponentPages),
      ],
    ),
  );
}
