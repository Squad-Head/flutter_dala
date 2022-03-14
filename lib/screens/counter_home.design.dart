// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_home.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final generatedScreensCounterHomeCounterHomePage = ViewerDocumentPage(
  id: 'counterHome',
  namespace: ['screens', 'counter_home'],
  title: 'CounterHome',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_anatomy',
      title: 'Anatomy',
      ctorName: 'CounterHome',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => CounterHome(
          title: factory.build(context, 'title'),
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
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:flutter_ui_toolkit/screens/counter_home.dart',
          code: '''
/// Built from the following function 
(context, factory) => CounterHome(title: factory.build(context, 'title'),)

/// Widget
class CounterHome extends StatefulWidget {
  const CounterHome({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CounterHome> createState() => _CounterHomeState();
}

'''),
    ),
    const ViewerSectionUnion.apiDocs(
      id: 'apiDocs',
      title: 'API reference',
    ),
  ],
);
