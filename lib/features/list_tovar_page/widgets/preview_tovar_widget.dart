// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coin/service/export_working_with_data.dart';

import 'export_previe_tovar_widget.dart';

class PreviewTovarWidget extends StatelessWidget {
  final Tovar tovar;
  const PreviewTovarWidget({
    Key? key,
    required this.tovar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> listImageUrl = tovar.listImageUrl;
    final String name = tovar.name;
    final double price = tovar.price;
    final int maxCountTovar = tovar.maxCountTovar;
    final String code = tovar.code;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          ImageWidget(listImageUrl: listImageUrl),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiscriptionWidget(
                name: name,
                price: price,
                maxCountTovar: maxCountTovar,
              ),
              const Expanded(flex: 1, child: SizedBox()),
              BasketWidget(
                code: code,
                maxCountTovar: maxCountTovar,
              ),
            ],
          )
        ],
      ),
    );
  }
}
