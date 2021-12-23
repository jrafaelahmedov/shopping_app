import 'package:flutter/material.dart';

import 'details_top_view.dart';
import 'item.dart';

class FruitsDetails extends StatelessWidget {
  const FruitsDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FruitsItem item;

  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            // Don't show the leading button
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                      ),
                      // Your widgets here
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.favorite, color: parseColor("#1EBF8E")),
                      ),
                      // Your widgets here
                    ],
                  ),
                )
              ],
            ),
            // leading: ,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: FruitDetailsItemTop(item),
          ),
        ),
      ),
    );
  }
}

Color parseColor(String color) {
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex =
        '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}
