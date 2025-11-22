part of 'allnews_bloc.dart';

sealed class AllnewsState {}

class AllnewsInitial extends AllnewsState {}

class Allnewsloading extends AllnewsState {}

class RecommendedNewsLoaded extends AllnewsState {
  final List<AllnewsModel> articles;

  RecommendedNewsLoaded({required this.articles});
}


class NewsError extends AllnewsState {
  final String messege;
  NewsError({required this.messege});
}
