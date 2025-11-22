part of 'discovernews_bloc.dart';

@immutable
sealed class DiscovernewsEvent {}

class FetchCategoryNewsEvent extends DiscovernewsEvent {
  final Category? category;
  FetchCategoryNewsEvent({this.category});
}