part of 'allnews_bloc.dart';


sealed class AllnewsEvent {}

class FetchNewsEvent extends AllnewsEvent {
  final Category? category;

  FetchNewsEvent({this.category});
}

class SearchNewsEvent extends AllnewsEvent {
  final String? query;
  SearchNewsEvent({this.query});
}
