import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'color_generator.dart';
import 'main.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    Future<Color> getMainColorImage() async {
      var imageBytes = (await rootBundle.load(image)).buffer.asUint8List();

      return getAverageColor(sortColors(extractPixelsColors(imageBytes)));
    }

    return FutureBuilder(
      future: getMainColorImage(),
      builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: snapshot.data?.withOpacity(0.5)),
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 10),
          child: Column(
            children: [
              Hero(
                tag: this,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(image, height: 80, fit: BoxFit.fitHeight),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.black,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 12),
                                child: RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 12,
                                  ignoreGestures: true,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: '\$',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8),
                                    ),
                                    TextSpan(
                                        text: ' 03.49',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: parseColor("#1EBF8E"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
