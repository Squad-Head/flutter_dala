import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_toolkit/presentation/desktop/desktop_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DalaApp extends HookConsumerWidget {
  const DalaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return DeviceFrameTheme(
      style: DeviceFrameStyle.dark(),
      child: MaterialApp(
          title: 'Device Frames',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const DesktopView()),
    );
  }
}
