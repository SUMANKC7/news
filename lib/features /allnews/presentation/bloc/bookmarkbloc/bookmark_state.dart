part of 'bookmark_bloc.dart';

sealed class BookmarkState  {
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<AllnewsModel> bookmarks;
  BookmarkLoaded({required this.bookmarks});

}
