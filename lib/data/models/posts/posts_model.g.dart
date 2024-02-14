// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostsModelAdapter extends TypeAdapter<PostsModel> {
  @override
  final int typeId = 1;

  @override
  PostsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostsModel(
      userId: fields[1] as int,
      id: fields[2] as int,
      title: fields[3] as String,
      body: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PostsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
