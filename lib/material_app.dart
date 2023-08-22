import 'package:coin/features/category_page/bloc/category_bloc.dart';
import 'package:coin/features/view.dart';
import 'package:coin/navigation/navigation.dart';
import 'package:coin/repositories/bitrix_repository/abstract_bitrix_repository.dart';
import 'package:coin/service/export_working_with_data.dart';
import 'package:coin/theme/material_app_theme/material_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'repositories/shared_preferences_repository/export_abstract_shared_preference.dart';

class CryptoCurrencesListApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const CryptoCurrencesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    final blocCategory = CategoryBloc(
        GetIt.I<AbstractBitrixRepository>(),
        GetIt.I<AbstractWorkingWithData>(),
        GetIt.I<AbstractSharedPreferenceRepository>());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => blocCategory,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: const CategoryPage(),
        initialRoute: mainNavigation.initialRoute,
        routes: mainNavigation.routes,
      ),
    );
  }
}
