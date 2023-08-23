// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:coin/navigation/router.dart';

class TovarPreviewWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int categoryId;

  const TovarPreviewWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

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
              AutoRouter.of(context).push(
                  ListTovarRoute(categoryId: categoryId, nameCategory: name));
            },
            child: Container()),
      ]),
    );
  }
}
