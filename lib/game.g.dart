// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      name: json['name'] as String,
      tileMap: (json['tileMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tileMap': instance.tileMap.map((k, e) => MapEntry(k.toString(), e)),
      'score': instance.score,
    };
