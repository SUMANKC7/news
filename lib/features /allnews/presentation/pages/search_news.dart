import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';

import 'package:weatherapp/features%20/allnews/presentation/bloc/searchnewsbloc/searchnewsbloc_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/homepage_widget/recommended_news.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({super.key});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  final TextEditingController queryController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    queryController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final query = queryController.text.toLowerCase().trim();
      context.read<SearchnewsblocBloc>().add(SearchNewsEvent(query: query));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.buttonBackground,
          ),
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            // Search Field
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textSecondary.withAlpha(50),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: queryController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search_rounded,
                            size: 30,
                            color: AppColors.textSecondary,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Search results
            BlocBuilder<SearchnewsblocBloc, SearchnewsblocState>(
              builder: (context, state) {
                if (state is SearchNewsloading) {
                  return CircularProgressIndicator();
                }
                if (state is SearchNewsLoaded) {
                  final List<AllnewsModel> newsarticles =
                      state.searchnewsarticles;
                  if (newsarticles.isEmpty) {
                    return Text("No results found");
                  }
                  return Expanded(
                    child: SingleChildScrollView(
                      child: ShowRecommendedNews(articles: newsarticles),
                    ),
                  );
                }
                if (state is SearchNewserror) {
                  return Center(child: Text("Error: ${state.messege}"));
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
