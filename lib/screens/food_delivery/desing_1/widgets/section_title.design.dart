// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_title.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

typedef _$FunctionAliasForPressViaSectionTitle = void Function();
final generatedScreensFoodDeliveryDesing1WidgetsSectionTitleSectionTitlePage =
    ViewerDocumentPage(
  id: 'sectionTitle',
  namespace: [
    'screens',
    'food_delivery',
    'desing_1',
    'widgets',
    'section_title'
  ],
  title: 'SectionTitle',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_anatomy',
      title: 'Anatomy',
      ctorName: 'SectionTitle',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => SectionTitle(
          title: factory.build(context, 'title'),
          press: factory.build(context, 'press'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'title',
            type: String,
            typeName: 'String',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: null,
            documentation: null,
          ),
          FieldMetaData(
            name: 'press',
            type: _$FunctionAliasForPressViaSectionTitle,
            typeName: 'void Function()',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: '''null''',
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location:
              'package:flutter_ui_toolkit/screens/food_delivery/desing_1/widgets/section_title.dart',
          code: '''
/// Built from the following function 
(context, factory) => SectionTitle(title: factory.build(context, 'title'),press: factory.build(context, 'press'),)

/// Widget
class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title, required this.press})
      : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: Theme.of(context).textTheme.headline6),
      TextButton(
          onPressed: press,
          style: TextButton.styleFrom(primary: kActiveColor),
          child: const Text("See All"))
    ]);
  }
}

'''),
    ),
    const ViewerSectionUnion.apiDocs(
      id: 'apiDocs',
      title: 'API reference',
    ),
  ],
);
