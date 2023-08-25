import 'package:auto_route/annotations.dart';
import 'package:coin/features/category_page/bloc/category_bloc.dart';
import 'package:coin/service/export_working_with_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/export_widgets.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryBloc = context.read<CategoryBloc>()
      ..add(LoadingBitrixCategoryEvent());

    return Scaffold(
      appBar: AppBar(
        actions: [
          BasketWidget(),
        ],
        title: const Text('Категории'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        bloc: categoryBloc,
        builder: (context, state) {
          if (state is LoadedBitrixState) {
            final List<Categories> listTovars = state.listTovars;
            return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Количество колонок
                  crossAxisSpacing: 15.0, // отсупы вертикальные
                  mainAxisSpacing: 15.0, // отсупы горизонтальные
                ),
                itemCount: listTovars.length,
                itemBuilder: (context, index) {
                  final data = listTovars[index];
                  final name = data.categoryName;
                  final imageUrl = data.tovars.elementAt(0).imageUrl;
                  final categoryId = data.categoryId;
                  return TovarPreviewWidget(
                    name: name,
                    imageUrl: imageUrl,
                    categoryId: categoryId,
                  );
                });
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
