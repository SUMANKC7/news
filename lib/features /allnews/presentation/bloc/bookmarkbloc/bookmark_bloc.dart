import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';


part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    on<LoadBookmarksEvent>(_onLoadBookmarks);
    on<ToggleBookmarkEvent>(_onToggleBookmark);
  }

  Future<void> _onLoadBookmarks(
      LoadBookmarksEvent event, Emitter<BookmarkState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList('bookmarks') ?? [];
    List<AllnewsModel> articles =
        bookmarks.map((e) => AllnewsModel.fromJson(jsonDecode(e))).toList();
    emit(BookmarkLoaded(bookmarks: articles));
  }

  Future<void> _onToggleBookmark(
      ToggleBookmarkEvent event, Emitter<BookmarkState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList('bookmarks') ?? [];
    String articleJson = jsonEncode(event.article.toJson());

    if (bookmarks.any((e) {
      final map = jsonDecode(e);
      return map['title'] == event.article.title;
    })) {
      // Remove
      bookmarks.removeWhere((e) {
        final map = jsonDecode(e);
        return map['title'] == event.article.title;
      });
    } else {
      bookmarks.add(articleJson);
    }

    await prefs.setStringList('bookmarks', bookmarks);

    // Emit updated list
    List<AllnewsModel> updatedArticles =
        bookmarks.map((e) => AllnewsModel.fromJson(jsonDecode(e))).toList();
    emit(BookmarkLoaded(bookmarks: updatedArticles));
  }
}
