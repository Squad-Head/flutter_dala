import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_toolkit/Projects/counter_app/counter_home.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

  runApp(const HotreloadWidgetbook());
}

class HotreloadWidgetbook extends StatelessWidget {
  const HotreloadWidgetbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookWidget(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'elevated',
                  builder: (context) => ElevatedButton(
                    onPressed: () {},
                    child: const Text('Widgetbook'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Counter App',
                  builder: (context) => const CounterHome(title: 'Counter App'),
                ),
              ],
            ),
          ],
        )
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      appInfo: AppInfo(name: 'Example'),
    );
  }
}
