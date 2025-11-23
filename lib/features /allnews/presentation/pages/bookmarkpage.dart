import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/bookmarkbloc/bookmark_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/homepage_widget/recommended_news.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<BookmarkBloc, BookmarkState>(
        builder: (context, state) {
          if (state is BookmarkLoaded) {
            if (state.bookmarks.isEmpty) {
              return Center(child: Text("No bookmarks yet"));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: ShowRecommendedNews(articles: state.bookmarks),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
