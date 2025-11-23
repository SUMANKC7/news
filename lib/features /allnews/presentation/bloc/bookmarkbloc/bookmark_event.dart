part of 'bookmark_bloc.dart';

sealed class BookmarkEvent  {

}

class LoadBookmarksEvent extends BookmarkEvent {}

class ToggleBookmarkEvent extends BookmarkEvent {
  final AllnewsModel article;
  ToggleBookmarkEvent({required this.article});

 
}
