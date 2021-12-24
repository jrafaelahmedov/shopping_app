import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_generator.dart';
import 'item.dart';
import 'main.dart';

class FruitDetailsItemTop extends StatefulWidget {
  // const FruitDetailsItemTop({
  //   Key? key,
  //   required this.item,
  // }) : super(key: key);

  late FruitsItem _item;

  FruitDetailsItemTop(FruitsItem item, {Key? key}) : super(key: key) {
    _item = item;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FruitDetailsItemTopState(_item);
  }

}

class FruitDetailsItemTopState extends State<FruitDetailsItemTop> {

  late FruitsItem _item;

  FruitDetailsItemTopState(FruitsItem item){
    _item = item;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Future<Color> getMainColorImage() async {
      var imageBytes = (await rootBundle.load(_item.image)).buffer.asUint8List();
      return getAverageColor(sortColors(extractPixelsColors(imageBytes)));
    }

    return FutureBuilder(
      future: getMainColorImage(),
      builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
        return SingleChildScrollView(
          child: Column(
            // direction: Axis.vertical,
            children: [
              Container(
                height: height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: snapshot.data?.withOpacity(0.5)),
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 5, bottom: 10),
                child: Hero(
                  tag: _item,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15, top: 50),
                    child: Image.asset(_item.image,
                        height: height * 0.5,
                        width: width * 0.8,
                        fit: BoxFit.scaleDown),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 10),
                    child: Text(
                      _item.title,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 20),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: parseColor("#1EBF8E"),
                                fontSize: 10),
                          ),
                          TextSpan(
                              text: ' 03.49',
                              style: TextStyle(
                                fontSize: 20,
                                color: parseColor("#1EBF8E"),
                                fontWeight: FontWeight.bold,
                              ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 12.0, left: 10),
                    child: Text("1 lb package"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 15, right: 30),
                    child: Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10),
                    child: Text(
                      "Watermelon is a flowering plant species of the Cucurbitaceae family. A scrambling and trailling vine-like plant, it was originally domesticated in Africa",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width*0.17,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: parseColor("#1EBF8E").withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "CAL",
                              style: TextStyle(
                                  color: parseColor("#1EBF8E"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            const Text(
                              "46",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width*0.17,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: parseColor("#1EBF8E").withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "FAT",
                              style: TextStyle(
                                  color: parseColor("#1EBF8E"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            const Text(
                              "0.5 g",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width*0.17,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: parseColor("#1EBF8E").withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "CARB",
                              style: TextStyle(
                                  color: parseColor("#1EBF8E"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            const Text(
                              "10 g",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width*0.17,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: parseColor("#1EBF8E").withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "PROT",
                              style: TextStyle(
                                  color: parseColor("#1EBF8E"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            const Text(
                              "1.5 g",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: SizedBox(
                  width: width,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Add to Bag'),
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(parseColor("#1ebf8e")),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(color: Colors.transparent),
                            ),
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}