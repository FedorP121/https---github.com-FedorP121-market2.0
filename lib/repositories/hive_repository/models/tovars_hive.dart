// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'tovars_hive.g.dart';

@HiveType(typeId: 0)
class TovarsForHive extends Equatable {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final int countPerson;

  const TovarsForHive({
    required this.code,
    required this.countPerson,
  });
  @override
  List<Object?> get props => [code, countPerson];
}
