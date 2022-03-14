import 'package:flutter/material.dart';
import 'package:flutter_ui_toolkit/ecommerce/constrants.dart';
import 'package:flutter_ui_toolkit/ecommerce/data.dart';
import 'package:flutter_ui_toolkit/ecommerce/screens/home/components/image_carousel.dart';
import 'package:flutter_ui_toolkit/ecommerce/screens/home/components/resurant_info_medium_card.dart';
import 'package:flutter_ui_toolkit/ecommerce/screens/home/components/section_title.dart';


class HomeScreens extends StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  "Delivery to".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: kActiveColor),
                ),
                const Text(
                  "San Fransisco",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Filter",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Featureed Partners",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  mediumCardData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: ResturantInfoMediumCard(
                      title: mediumCardData[index]['name'],
                      location: mediumCardData[index]['location'],
                      image: mediumCardData[index]['image'],
                      deliveryTime: mediumCardData[index]['delivertTime'],
                      rating: mediumCardData[index]['rating'],
                      press: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Image.asset("assets/image1.jpg"),
            ),
          )
        ],
      ),
    );
  }
}

