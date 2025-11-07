// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allnews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllnewsModel _$AllnewsModelFromJson(Map<String, dynamic> json) => AllnewsModel(
  id: json['id'] as String? ?? 'No key',
  name: json['name'] as String? ?? 'Missing name',
  author: json['author'] as String? ?? 'Missing author',
  title: json['title'] as String? ?? 'Missing title',
  description: json['description'] as String? ?? 'Missing description',
  url: json['url'] as String? ?? 'Missing news url',
  urlToImage: json['urlToImage'] as String? ?? 'Missing images',
  publishedAt: json['publishedAt'] as String? ?? 'Missing published date',
  content: json['content'] as String? ?? 'Missing content',
);

Map<String, dynamic> _$AllnewsModelToJson(AllnewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
