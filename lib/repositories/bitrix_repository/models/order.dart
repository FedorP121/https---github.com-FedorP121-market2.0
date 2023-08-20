// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final bool status;
  final int orderNumber;
  const Order({
    required this.status,
    required this.orderNumber,
  });

  @override
  List<Object> get props => [status, orderNumber];
}
