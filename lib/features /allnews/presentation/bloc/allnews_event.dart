part of 'allnews_bloc.dart';

@immutable
sealed class AllnewsEvent {}

class FetchNewsEvent extends AllnewsEvent {
  final String? category;

  FetchNewsEvent({ this.category});

}
