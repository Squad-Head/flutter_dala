import 'package:flutter/material.dart';
import 'package:flutter_ui_toolkit/presentation/dala_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: DalaApp()));
}
