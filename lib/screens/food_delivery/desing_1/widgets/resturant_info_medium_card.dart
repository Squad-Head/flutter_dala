import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_ui_toolkit/screens/food_delivery/desing_1/constrants.dart';

import '../data.dart';
part 'resturant_info_medium_card.design.dart';

class ResturantInfo {
  const ResturantInfo({
    required this.title,
    required this.image,
    required this.deliveryTime,
    required this.rating,
    required this.location,
  });

  final String title, image, location;
  final int deliveryTime;
  final double rating;
}

@design
class ResturantInfoMediumCard extends StatelessWidget {
  const ResturantInfoMediumCard({
    Key? key,
    required this.resturantInfo,
  }) : super(key: key);

  @DesignField(
      parameter: ResturantInfo(
          title: 'Daylight cofee',
          image:
              'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          deliveryTime: 24,
          rating: 4.6,
          location: 'colorado, San Fransisc'))
  final ResturantInfo resturantInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
      onTap: () {},
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.network(resturantInfo.image),
            ),
            const SizedBox(height: defaultPadding / 5),
            Text(
              mediumCardData[0]["name"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              resturantInfo.location,
              maxLines: 1,
              style: const TextStyle(
                color: kBodyTextColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding / 8,
                      ),
                      decoration: const BoxDecoration(
                        color: kActiveColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Text(
                        resturantInfo.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Text("${resturantInfo.deliveryTime} min"),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: Color(0xFF868686),
                    ),
                    const Spacer(),
                    const Text("Free Delivery"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
