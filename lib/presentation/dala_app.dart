import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_toolkit/Projects/counter_app/counter_home.dart';
import 'package:flutter_ui_toolkit/application/home/home_provider.dart';
import 'package:flutter_ui_toolkit/application/home/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DalaApp extends HookConsumerWidget {
  const DalaApp({Key? key}) : super(key: key);

  Widget _frame(DeviceInfo device, HomeState state, Key screenKey) => Center(
        child: DeviceFrame(
          device: device,
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

  @override
  Widget build(BuildContext context, ref) {
    final GlobalKey screenKey = useMemoized(() => GlobalKey());
    final state = ref.watch(homeProvider);

    final event = ref.read(homeProvider.notifier);
    return DeviceFrameTheme(
      style: DeviceFrameStyle.dark(),
      child: MaterialApp(
        title: 'Device Frames',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DefaultTabController(
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
                /*IconButton(
                  onPressed: () {
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  icon: Icon(Icons.check),
                ),*/
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  ...Devices.all.map(
                    (x) => Tab(
                      text: '${x.identifier.type} ${x.name}',
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Builder(
                  builder: (context) => !state.isEnabled
                      ? CounterHome(
                          key: screenKey,
                          title: 'abc',
                        )
                      : AnimatedBuilder(
                          animation: DefaultTabController.of(context)!,
                          builder: (context, _) => _frame(
                              Devices
                                  .all[DefaultTabController.of(context)!.index],
                              state,
                              screenKey),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
