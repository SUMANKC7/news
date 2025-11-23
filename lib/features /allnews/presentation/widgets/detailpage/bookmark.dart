import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/bookmarkbloc/bookmark_bloc.dart';

class BookmarkButton extends StatelessWidget {
  final AllnewsModel article;
  const BookmarkButton({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        bool isBookmarked = false;
        if (state is BookmarkLoaded) {
          isBookmarked =
              state.bookmarks.any((e) => e.title == article.title);
        }

        return IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_outline_rounded,
            color: isBookmarked
                ? AppColors.primaryColor
                : AppColors.backgroundColor,
          ),
          onPressed: () {
            context.read<BookmarkBloc>().add(ToggleBookmarkEvent(article: article));
          },
        );
      },
    );
  }
}
