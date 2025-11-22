part of 'discovernews_bloc.dart';

@immutable
sealed class DiscovernewsState {}

final class DiscovernewsInitial extends DiscovernewsState {}

class DiscoverNewsloading extends DiscovernewsState {}

class DiscoverNewsError extends DiscovernewsState {
  final String messege;
  DiscoverNewsError({required this.messege});
}

class CategoryNewsLoaded extends DiscovernewsState {
  final List<AllnewsModel> categorynewsarticles;
  CategoryNewsLoaded({required this.categorynewsarticles});
}