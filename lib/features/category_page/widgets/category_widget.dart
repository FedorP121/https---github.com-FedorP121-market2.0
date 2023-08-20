// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coin/navigation/navigation.dart';

class TovarPreviewWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int counterTovars;
  const TovarPreviewWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.counterTovars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    return ListTile(
        leading: Image(width: 80, height: 80, image: NetworkImage(imageUrl)),
        title: Text(name, style: bodyMedium),
        subtitle: Text(counterTovars.toString(), style: bodySmall),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () async {
          Navigator.of(context).pushNamed(Navigation.listTovars);
        });
  }
}
