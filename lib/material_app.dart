import 'package:coin/features/basket_page/bloc/basket_bloc.dart';
import 'package:coin/features/category_page/bloc/category_bloc.dart';
import 'package:coin/features/list_tovar_page/bloc/export_bloc.dart';
import 'package:coin/navigation/router.dart';
import 'package:coin/repositories/bitrix_repository/abstract_bitrix_repository.dart';
import 'package:coin/service/export_working_with_data.dart';
import 'package:coin/theme/material_app_theme/material_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'repositories/hive_repository/export_abstract_hive.dart';
import 'repositories/shared_preferences_repository/export_abstract_shared_preference.dart';

class CryptoCurrencesListApp extends StatefulWidget {
  const CryptoCurrencesListApp({super.key});

  @override
  State<CryptoCurrencesListApp> createState() => _CryptoCurrencesListAppState();
}

class _CryptoCurrencesListAppState extends State<CryptoCurrencesListApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final blocCategory = CategoryBloc(
        GetIt.I<AbstractBitrixRepository>(),
        GetIt.I<AbstractWorkingWithData>(),
        GetIt.I<AbstractSharedPreferenceRepository>());

    final blocTovarsCategories = TovarsCategoryBloc(
      GetIt.I<AbstractWorkingWithData>(),
      GetIt.I<AbstractSharedPreferenceRepository>(),
      GetIt.I<AbstractHiveRepository>(),
    );

    final imageCounterBloc = ImageCounterBloc();
    final basketBloc = BasketBloc();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (context) => blocCategory,
        ),
        BlocProvider(
          lazy: true,
          create: (context) => blocTovarsCategories,
        ),
        BlocProvider(
          lazy: true,
          create: (context) => imageCounterBloc,
        ),
        BlocProvider(
          lazy: true,
          create: (context) => basketBloc,
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: theme,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
