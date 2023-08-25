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
          if (state.availability == false) {
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart));
          } else {
            return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.yellow,
                ));
          }
        }
        return IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart));
      },
    );
  }
}
