// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../TaskBox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskBoxAdaptor extends TypeAdapter<TaskBox> {
  @override
  final int typeId = 0;

  @override
  TaskBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskBox()
      ..Name = fields[0] as String
      ..Type = fields[1] as String
      ..time = fields[2] as DateTime
      ..isDone = fields[3] as bool
      ..notify = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, TaskBox obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.Name)
      ..writeByte(1)
      ..write(obj.Type)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.isDone)
      ..writeByte(4)
      ..write(obj.notify);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskBoxAdaptor &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
