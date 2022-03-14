import 'package:device_frame/device_frame.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deviceProvider = StateNotifierProvider<DeviceNotifier, DeviceInfo>((ref) {
  return DeviceNotifier();
});

class DeviceNotifier extends StateNotifier<DeviceInfo> {
  DeviceNotifier() : super(Devices.ios.iPhone12ProMax);

  changeDevice(DeviceInfo device) => state = device;
}
