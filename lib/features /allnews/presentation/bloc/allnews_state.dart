part of 'allnews_bloc.dart';

@immutable
sealed class AllnewsState {}

class AllnewsInitial extends AllnewsState {}

class Allnewsloading extends AllnewsState {}

class Newsloaded extends AllnewsState {
  final List<AllnewsModel> articles;

  Newsloaded({required this.articles});
}

class NewsError extends AllnewsState {
  final String messege;
  NewsError({required this.messege});
}
