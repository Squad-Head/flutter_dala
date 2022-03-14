import 'package:flutter/material.dart';
import 'package:flutter_ui_toolkit/presentation/common_values/colors.dart';

class CodeSnippetBlock extends StatelessWidget {
  final double maxHeight;
  final double maxWidth;
  const CodeSnippetBlock({
    Key? key,
    required this.maxHeight,
    required this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: maxHeight,
        width: maxWidth * 0.30,
        child: Column(
          children: [
            Container(
              height: maxHeight * 0.35,
              decoration: BoxDecoration(
                  color: CommonColors.containeColor,
                  borderRadius: BorderRadius.circular(25)),
            ),
            SizedBox(
              height: maxHeight * 0.03,
            ),
            Container(
              height: maxHeight * 0.62,
              decoration: BoxDecoration(
                color: CommonColors.containeColor,
                borderRadius: BorderRadius.circular(25),
              ),
            )
          ],
        ));
  }
}
