// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screens.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final generatedScreensFoodDeliveryDesing1HomeScreensHomeScreensPage =
    ViewerDocumentPage(
  id: 'homeScreens',
  namespace: ['screens', 'food_delivery', 'desing_1', 'home_screens'],
  title: '''Food delivery design 1''',
  subtitle: null,
  description: '''Mordern design ui implemented with minimal code''',
  sections: [
    ViewerSectionUnion.component(
      id: 'component_anatomy',
      title: 'Anatomy',
      ctorName: 'HomeScreens',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => HomeScreens(),
        fieldMetaDataset: const [],
      ),
      sourceCode: const ViewerSourceCode(
          location:
              'package:flutter_ui_toolkit/screens/food_delivery/desing_1/home_screens.dart',
          code: '''
/// Built from the following function 
(context, factory) => HomeScreens()

/// Widget
class HomeScreens extends StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Column(children: [
            Text("Delivery to".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: kActiveColor)),
            const Text("San Fransisco", style: TextStyle(color: Colors.black))
          ]),
          actions: [
            TextButton(
                onPressed: () {},
                child:
                    const Text("Filter", style: TextStyle(color: Colors.black)))
          ]),
      const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          sliver: SliverToBoxAdapter(child: ImageCarousel())),
      SliverPadding(
          padding: const EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
              child: SectionTitle(title: "Featureed Partners", press: () {}))),
      SliverToBoxAdapter(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      mediumCardData.length,
                      (index) => const Padding(
                          padding: EdgeInsets.only(right: defaultPadding),
                          child: ResturantInfoMediumCard(
                              resturantInfo: ResturantInfo(
                                  title: 'Daylight cofee',
                                  image:
                                      'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                  deliveryTime: 24,
                                  rating: 4.6,
                                  location: 'colorado, San Fransisc'))))))),
      SliverPadding(
          padding: const EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
              child: Image.network(
                  "https://images.pexels.com/photos/3026808/pexels-photo-3026808.jpeg?auto=compress&cs=tinysrgb&w=800")))
    ]));
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
