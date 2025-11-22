part of 'searchnewsbloc_bloc.dart';

@immutable
sealed class SearchnewsblocState {}

final class SearchnewsblocInitial extends SearchnewsblocState {}

class SearchNewsloading extends SearchnewsblocState {}

class SearchNewsLoaded extends SearchnewsblocState {
  final List<AllnewsModel> searchnewsarticles;
  SearchNewsLoaded({required this.searchnewsarticles});
}

class SearchNewserror extends SearchnewsblocState {
  final String messege;
  SearchNewserror({required this.messege});
}



