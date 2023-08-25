import 'package:flutter/material.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart));
  }
}
