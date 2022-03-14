import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_toolkit/application/device/device_provider.dart';
import 'package:flutter_ui_toolkit/application/home/home_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Projects/counter_app/counter_home.dart';

class DeviceFrameViewer extends ConsumerWidget {
  final DeviceInfo device;
  final Key screenKey;
  const DeviceFrameViewer({
    Key? key,
    required this.device,
    required this.screenKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeProvider);
    final deviceState = ref.watch(deviceProvider);
    return Center(
      child: DeviceFrame(
        device: deviceState,
        isFrameVisible: state.isFrameVisible,
        orientation: state.orientation,
        screen: Container(
          color: Colors.blue,
          child: VirtualKeyboard(
            isEnabled: state.isKeyboard,
            child: CounterHome(
              key: screenKey,
              title: 'uuou',
            ),
          ),
        ),
      ),
    );
  }
}
