import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_toolkit/Projects/counter_app/counter_home.dart';
import 'package:flutter_ui_toolkit/application/device/device_provider.dart';
import 'package:flutter_ui_toolkit/application/home/home_provider.dart';
import 'package:flutter_ui_toolkit/presentation/common_values/colors.dart';
import 'package:flutter_ui_toolkit/presentation/desktop/widget/device_frame_viewer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeviceBlock extends ConsumerWidget {
  final double maxWidth;
  final Key screenKey;
  final double maxHeight;
  const DeviceBlock(
      {Key? key,
      required this.maxWidth,
      required this.maxHeight,
      required this.screenKey})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeProvider);
    final deviceState = ref.watch(deviceProvider);
    return Column(
      children: [
        Container(
          width: maxWidth * 0.30,
          decoration: BoxDecoration(
              color: CommonColors.containeColor,
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(10),
          child: DropdownButton<DeviceInfo>(
            value: deviceState,
            onChanged: (device) {
              if (device != null) {
                ref.read(deviceProvider.notifier).changeDevice(device);
              }
            },
            underline: const SizedBox.shrink(),
            items: Devices.all
                .map((e) => DropdownMenuItem(
                      child: Text(
                        e.name,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      value: e,
                    ))
                .toList(),
          ),
        ),
        Container(
          height: maxHeight * 0.02,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: maxWidth * 0.02),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: CommonColors.containeColor,
                borderRadius: BorderRadius.circular(25)),
            // height: maxHeight,
            width: maxWidth * 0.30,
            child: Builder(
              // why we using builder here ?
              builder: (context) => !state.isEnabled
                  ? CounterHome(
                      key: screenKey,
                      title: 'abc',
                    )
                  : AnimatedBuilder(
                      animation: DefaultTabController.of(context)!,
                      builder: (context, _) => DeviceFrameViewer(
                          device: Devices
                              .all[DefaultTabController.of(context)!.index],
                          screenKey: screenKey),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
