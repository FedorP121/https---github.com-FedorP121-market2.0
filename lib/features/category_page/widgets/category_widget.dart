// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coin/navigation/navigation.dart';

class TovarPreviewWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  const TovarPreviewWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    return Card(
      elevation: 7.0, // тень
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(imageUrl),
            ),
            Text(
              name,
              style: bodySmall,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Navigation.listTovars);
            },
            child: Container()),
      ]),
    );
  }
}
