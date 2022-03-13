import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_toolkit/Projects/counter_app/counter_home.dart';
import 'package:flutter_ui_toolkit/application/home/home_provider.dart';
import 'package:flutter_ui_toolkit/application/home/home_state.dart';
import 'package:flutter_ui_toolkit/presentation/common_values/colors.dart';
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

    String _exampleCode =
        "class MyHomePage extends StatefulWidget { MyHomePage({Key key, this.title}) : super(key: key); final String title; @override _MyHomePageState createState() => _MyHomePageState();}";

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
                child: LayoutBuilder(
                  builder: (context, constrainsts) => Row(
                    children: [
                      Expanded(child: Container()),

                      //First Container //For widget lists
                      Container(
                        decoration: BoxDecoration(
                            // color: CommonColors.containeColor,
                            borderRadius: BorderRadius.circular(25)),
                        height: constrainsts.maxHeight,
                        width: constrainsts.maxWidth * 0.30,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: CommonColors.containeColor,
                                  borderRadius: BorderRadius.circular(25)),
                              height: constrainsts.maxHeight * 0.1,
                            ),
                            SizedBox(
                              height: constrainsts.maxHeight * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: CommonColors.containeColor,
                                  borderRadius: BorderRadius.circular(25)),
                              height: constrainsts.maxHeight * 0.86,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: constrainsts.maxWidth * 0.02,
                      ),

                      //Second Container //For emulation the devices.
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: CommonColors.containeColor,
                            borderRadius: BorderRadius.circular(25)),
                        height: constrainsts.maxHeight,
                        width: constrainsts.maxWidth * 0.30,
                        child: Builder(
                          // why we using builder here ?
                          builder: (context) => !state.isEnabled
                              ? CounterHome(
                                  key: screenKey,
                                  title: 'abc',
                                )
                              : AnimatedBuilder(
                                  animation: DefaultTabController.of(context)!,
                                  builder: (context, _) => _frame(
                                      Devices.all[
                                          DefaultTabController.of(context)!
                                              .index],
                                      state,
                                      screenKey),
                                ),
                        ),
                      ),
                      SizedBox(
                        width: constrainsts.maxWidth * 0.02,
                      ),

                      //Third Container //For Code snippet showing.
                      SizedBox(
                          height: constrainsts.maxHeight,
                          width: constrainsts.maxWidth * 0.30,
                          child: Column(
                            children: [
                              Container(
                                height: constrainsts.maxHeight * 0.35,
                                decoration: BoxDecoration(
                                    color: CommonColors.containeColor,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              SizedBox(
                                height: constrainsts.maxHeight * 0.03,
                              ),
                              Container(
                                height: constrainsts.maxHeight * 0.62,
                                decoration: BoxDecoration(
                                  color: CommonColors.containeColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                // child: const SingleChildScrollView(
                                //     // child: HighlightView(
                                //     //   _exampleCode,
                                //     //   language: 'dart',
                                //     // ),
                                //     ),
                              )
                            ],
                          )),
                      Expanded(child: Container()),
                    ],
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
