part of 'searchnewsbloc_bloc.dart';

@immutable
sealed class SearchnewsblocEvent {}

class SearchNewsEvent extends SearchnewsblocEvent {
  final String? query;
  SearchNewsEvent({this.query});
}