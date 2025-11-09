import 'package:json_annotation/json_annotation.dart';

part 'allnews_model.g.dart';

@JsonSerializable()
class AllnewsModel {
  @JsonKey(defaultValue: "No key")  
  final String? id;

  @JsonKey(defaultValue: "Missing name") 
  final String? name;

  @JsonKey(defaultValue: "Missing author") 
  final String? author;

  @JsonKey(defaultValue: "Missing title") 
  final String? title;

  @JsonKey(defaultValue: "Missing description") 
  final String? description;

  @JsonKey(defaultValue: "Missing news url") 
  final String? url;

  @JsonKey(defaultValue: "Missing images") 
  final String? urlToImage;

  @JsonKey(defaultValue: "Missing published date") 
  final String? publishedAt;

  @JsonKey(defaultValue: "Missing content") 
  final String? content;

  AllnewsModel({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory AllnewsModel.fromJson(Map<String, dynamic> json) =>
      _$AllnewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllnewsModelToJson(this);
}
