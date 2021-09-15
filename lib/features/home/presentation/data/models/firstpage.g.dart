// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firstpage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FirstpageAdapter extends TypeAdapter<Firstpage> {
  @override
  final int typeId = 0;

  @override
  Firstpage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Firstpage()
      ..typeExercise = fields[0] as int
      ..isvisible = fields[1] as bool
      ..Gender = fields[2] as int
      ..Age = fields[3] as double
      ..Length = fields[4] as double
      ..Weight = fields[5] as double
      .._eating = fields[6] as double
      .._carb = fields[7] as double
      .._fat = fields[8] as double
      .._prot = fields[9] as double
      ..remining = fields[10] as double
      ..initialzingDate = fields[11] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Firstpage obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.typeExercise)
      ..writeByte(1)
      ..write(obj.isvisible)
      ..writeByte(2)
      ..write(obj.Gender)
      ..writeByte(3)
      ..write(obj.Age)
      ..writeByte(4)
      ..write(obj.Length)
      ..writeByte(5)
      ..write(obj.Weight)
      ..writeByte(6)
      ..write(obj._eating)
      ..writeByte(7)
      ..write(obj._carb)
      ..writeByte(8)
      ..write(obj._fat)
      ..writeByte(9)
      ..write(obj._prot)
      ..writeByte(10)
      ..write(obj.remining)
      ..writeByte(11)
      ..write(obj.initialzingDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirstpageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
