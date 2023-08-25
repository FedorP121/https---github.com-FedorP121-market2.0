// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:coin/features/list_tovar_page/bloc/export_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coin/service/export_working_with_data.dart';

import 'view.dart';

@RoutePage()
class ListTovarPage extends StatelessWidget {
  final int categoryId;
  final String nameCategory;
  const ListTovarPage({
    Key? key,
    required this.categoryId,
    required this.nameCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocTovarsCategories = context.read<TovarsCategoryBloc>()
      ..add(ReadTovarCategoryEvent(categoryId: categoryId));
    return Scaffold(
        appBar: AppBar(
          title: Text(nameCategory),
        ),
        body: BlocBuilder<TovarsCategoryBloc, TovarCategoryState>(
          bloc: blocTovarsCategories,
          builder: (context, state) {
            if (state is TovarCategoryLoadedState) {
              final tovarsCategories = state.tovarsCategories;

              return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int index) {
                    final Tovar tovar = tovarsCategories[index];
                    return PreviewTovarWidget(tovar: tovar);
                  },
                  itemCount: tovarsCategories.length);
            }

            if (state is TovarCategoryErrorState) {
              final error = state.error;
              return Center(
                  child: Column(
                children: [
                  const Text('Произошла ошибка'),
                  const SizedBox(height: 15),
                  Text(error.toString()),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => blocTovarsCategories
                        .add(ReadTovarCategoryEvent(categoryId: categoryId)),
                    child: const Text('Перезагрузить'),
                  )
                ],
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
