// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin/repositories/bitrix_repository/export_abstract_bitrix.dart';

import 'export_working_with_data.dart';

class WorkingWithData implements AbstractWorkingWithData {
  @override
  List<Categories> sortTovarList(List<TovarsBitrix> listTovarsFromBitrix) {
    final Set<Categories> setListTovar = {};

    // пробегаемся про пришедшему списку из Bitrix и категории записываем
    // в сет только categoryId и categoryName
    // метод loadTovar() позволяет сразу записать данные в tovars
    for (var element in listTovarsFromBitrix) {
      setListTovar.add(Categories(
        categoryId: element.categoryId,
        categoryName: element.categoryName,
        tovars: loadTovar(
          listTovarsFromBitrix,
          element.categoryId,
          element.categoryName,
        ),
      ));
    }

    return setListTovar.toList();
  }
}

// метод loadTovar() позволяет сразу записать данные в tovars
List<Tovar> loadTovar(List<TovarsBitrix> listTovarsFromBitrix, int categoryId,
    String categoryName) {
  final List<Tovar> tovarList = [];

  for (var element in listTovarsFromBitrix) {
    if (element.categoryId == categoryId &&
        element.categoryName == categoryName) {
      tovarList.add(Tovar(
        code: element.code,
        name: element.tovar.name,
        price: element.tovar.price,
        maxCountTovar: element.tovar.maxCountTovar,
        imageUrl: element.tovar.imageUrl,
        description: element.tovar.description,
        characteristics: Characteristic(
          width: element.tovar.characteristics.width,
          height: element.tovar.characteristics.height,
          diagonal: element.tovar.characteristics.diagonal,
        ),
      ));
    }
  }

  return tovarList;
}
