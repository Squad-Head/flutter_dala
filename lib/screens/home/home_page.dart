import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
part 'home_page.design.dart';

@Design(showApiDocs: false)
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
