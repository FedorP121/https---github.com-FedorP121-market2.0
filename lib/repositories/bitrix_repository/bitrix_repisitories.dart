// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dio/dio.dart';
import 'abstract_bitrix_repository.dart';
import 'models/models.dart';

class BitrixRepository implements AbstractBitrixRepository {
  final Dio dio;
  BitrixRepository({
    required this.dio,
  });

  @override
  Future<List<TovarsBitrix>> loadTovarFromBitrix() async {
    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    final requestBody = {'catalog_id': '4'};
    const urlBitrix = "http://dev1.srv.company/rest/vse-tovari-iz-kategorii/";
    final response = await dio.post(
      urlBitrix,
      data: requestBody,
    );

    final data = jsonDecode(response.data);

    final List<TovarsBitrix> listTovarsFromBitrix = [];
    for (var tovar in data) {
      listTovarsFromBitrix.add(
        TovarsBitrix(
          categoryId: int.parse(tovar['section_id']),
          categoryName: tovar['section_name'],
          code: tovar['id_tovar'],
          tovar: TovarDis(
            name: tovar['tovar_name'].toString().replaceAll('&quot;', '"'),
            price: double.parse(tovar['base_price']),
            maxCountTovar: 10, //int.parse(tovar['stock_quantity']),
            imageUrl: [tovar['detail_picture']],
            description: tovar['detail_text'],
            characteristics: const Characteristics(
              width: 100,
              height: 100,
              diagonal: 100,
            ),
          ),
        ),
      );
    }
    return listTovarsFromBitrix;
  }

  @override
  Future<List<Order>> loadOrderFromBitrix() async {
    final List<Order> a = [];
    return a;
  }
}
