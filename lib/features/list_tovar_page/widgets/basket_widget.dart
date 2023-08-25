import 'package:coin/features/list_tovar_page/bloc/export_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketWidget extends StatelessWidget {
  final String code;
  final int maxCountTovar;
  const BasketWidget({
    Key? key,
    required this.code,
    required this.maxCountTovar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocTovarsCategories = context.read<TovarsCategoryBloc>();
    return Expanded(
      flex: 4,
      child: ElevatedButton(
        onPressed: maxCountTovar > 0
            ? () => blocTovarsCategories.add(SaveTovarInBasketEvent(code: code))
            : null,
        child: const Text(maxLines: 1, 'В корзину'),
      ),
    );
  }
}
