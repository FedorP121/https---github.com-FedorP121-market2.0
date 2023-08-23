import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageURL;
  const ImageWidget({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(
              // fit: BoxFit.fill,
              image: NetworkImage(imageURL.toString()),
            ),
          ),
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {},
        child: const SizedBox(
          width: double.infinity,
          height: 225,
        ),
      ),
    ]);
  }
}
