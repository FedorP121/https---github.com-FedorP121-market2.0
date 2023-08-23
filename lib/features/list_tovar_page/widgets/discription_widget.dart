import 'package:flutter/material.dart';

class DiscriptionWidget extends StatelessWidget {
  final String name;
  final double price;
  final int maxCountTovar;
  const DiscriptionWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.maxCountTovar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 2,
            name.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Цена $price руб.',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            'Количество на складе $maxCountTovar шт.',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
