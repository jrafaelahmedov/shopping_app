import 'package:flutter/material.dart';

import 'details_top_view.dart';
import 'item.dart';

class ImageOpenContainer extends StatelessWidget {
  const ImageOpenContainer({
    required Key key,
    required this.openContainer,
    required this.item,
  }) : super(key: key);

  final VoidCallback openContainer;
  final FruitsItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openContainer,
      child:FruitDetailsItemTop(item,)
    );
  }
}