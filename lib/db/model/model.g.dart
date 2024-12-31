// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class addDetailModelAdapter extends TypeAdapter<addDetailModel> {
  @override
  final int typeId = 1;

  @override
  addDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return addDetailModel(
      Name: fields[0] as String,
      Age: fields[1] as num?,
      Key1: fields[2] as int?,
      Gender: fields[3] as String?,
      isDeleted: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, addDetailModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.Name)
      ..writeByte(1)
      ..write(obj.Age)
      ..writeByte(2)
      ..write(obj.Key1)
      ..writeByte(3)
      ..write(obj.Gender)
      ..writeByte(4)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is addDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
