import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_toolkit/application/home/home_provider.dart';
import 'package:flutter_ui_toolkit/presentation/common_values/colors.dart';
import 'package:flutter_ui_toolkit/presentation/tree_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'blocks/code_snippet.dart';
import 'blocks/device.dart';

class DesktopView extends HookConsumerWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final GlobalKey screenKey = useMemoized(() => GlobalKey());
    final state = ref.watch(homeProvider);

    final event = ref.read(homeProvider.notifier);
    return DefaultTabController(
      length: Devices.all.length,
      child: Scaffold(
        backgroundColor: state.isDark ? Colors.white : Colors.black,
        appBar: AppBar(
          title: const Text('Device Frames'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                event.toggleFrame();
              },
              icon: const Icon(Icons.settings_brightness),
            ),
            IconButton(
              onPressed: () {
                event.enableDisable();
              },
              icon: const Icon(Icons.settings_brightness),
            ),
            IconButton(
              onPressed: () {
                event.toggleDarkNess();
              },
              icon: const Icon(Icons.brightness_medium),
            ),
            IconButton(
              onPressed: () {
                event.toggleOrientation();
              },
              icon: const Icon(Icons.rotate_90_degrees_ccw),
            ),
            IconButton(
              onPressed: () {
                event.toggleKeyboard();
              },
              icon: const Icon(Icons.keyboard),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: LayoutBuilder(
              builder: (context, constrainsts) => Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: CommonColors.containeColor,
                        borderRadius: BorderRadius.circular(25)),
                    height: constrainsts.maxHeight,
                    width: constrainsts.maxWidth * 0.30,
                    child: Container(
                        decoration: BoxDecoration(
                            color: CommonColors.containeColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const TreeViewWidget()),
                  ),

                  DeviceBlock(
                      maxWidth: constrainsts.maxWidth,
                      maxHeight: constrainsts.maxHeight,
                      screenKey:
                          screenKey), //Third Container //For Code snippet showing.
                  CodeSnippetBlock(
                    maxHeight: constrainsts.maxHeight,
                    maxWidth: constrainsts.maxWidth,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
