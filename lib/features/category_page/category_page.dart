import 'package:coin/features/category_page/bloc/category_bloc.dart';
import 'package:coin/repositories/bitrix_repository/export_abstract_bitrix.dart';
import 'package:coin/service/export_working_with_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'widgets/category_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryBloc = CategoryBloc(
        GetIt.I<AbstractBitrixRepository>(), GetIt.I<AbstractWorkingWithData>())
      ..add(LoadingBitrixCategoryEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        bloc: categoryBloc,
        builder: (context, state) {
          if (state is LoadedBitrixState) {
            final List<Categories> listTovars = state.listTovars;
            return ListView.separated(
                itemBuilder: (context, index) {
                  final name = listTovars[index].categoryName;
                  final imageUrl =
                      listTovars[index].tovars.elementAt(0).imageUrl;

                  final counterTovars = listTovars[index].tovars.length;
                  return TovarPreviewWidget(
                      name: name,
                      imageUrl: imageUrl[0],
                      counterTovars: counterTovars);
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: listTovars.length);
          }
          if (state is ErrorBitrixState) {
            final error = state.error;
            return Center(
              child: Column(
                children: [
                  const Text('Произошла ошибка'),
                  const SizedBox(height: 15),
                  Text(error.toString()),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () =>
                        categoryBloc.add(LoadingBitrixCategoryEvent()),
                    child: const Text('Перезагрузить'),
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
