import 'package:flutter/material.dart';

class BasketWidget extends StatelessWidget {
  final String code;
  const BasketWidget({
    Key? key,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(maxLines: 1, 'В корзину'),
      ),
    );
  }
}
