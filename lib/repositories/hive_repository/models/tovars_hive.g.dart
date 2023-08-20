// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tovars_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TovarsForHiveAdapter extends TypeAdapter<TovarsForHive> {
  @override
  final int typeId = 0;

  @override
  TovarsForHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TovarsForHive(
      code: fields[0] as String,
      countPerson: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TovarsForHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.countPerson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TovarsForHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
