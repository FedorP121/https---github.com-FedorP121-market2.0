import 'package:coin/features/basket_page/bloc/basket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarBasketWidget extends StatelessWidget {
  const AppBarBasketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basketBloc = context.read<BasketBloc>()..add(CheckTovarInHive());
    return BlocBuilder<BasketBloc, BasketState>(
      bloc: basketBloc,
      builder: (context, state) {
        if (state is LoadedTrueCheckBasketState) {
          return IconButton(
            onPressed: () {
              // Действия при нажатии на иконку корзины
            },
            icon: Icon(
              Icons.shopping_cart,
              color: state.availability ? Colors.yellow : null,
            ),
          );
        }
        return IconButton(
          onPressed: () {
            // Действия при нажатии на иконку корзины
          },
          icon: const Icon(Icons.shopping_cart),
        );
      },
    );
  }
}
