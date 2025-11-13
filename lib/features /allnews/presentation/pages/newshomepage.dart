import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/allnews_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/homepage_widget/carousel_page_indicator.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/homepage_widget/recommended_news.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/homepage_widget/showcarouselslider.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({super.key});

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  int _activeIndex = 0;
  int _itemCount = 0;
  List<AllnewsModel> _articles = [];

  void _onPageChanged(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.buttonBackground,
            ),
            icon: Icon(CupertinoIcons.search, size: 25),
          ),
          SizedBox(width: 13),
        ],
      ),
      body: BlocListener<AllnewsBloc, AllnewsState>(
        listener: (context, state) {
          if (state is Newsloaded) {
            setState(() {
              _itemCount = state.articles.length;
              _articles = state.articles;
            });
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 17,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breaking News",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ShowCarouselSlider(onPageChanged: _onPageChanged),
              SizedBox(height: 10),
              if (_itemCount > 0)
                CarouselPageIndicator(
                  activeIndex: _activeIndex,
                  itemcount: _itemCount,
                ),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 17,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommendation",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 17,
                  vertical: 8,
                ),
                child: ShowRecommendedNews(articles: _articles),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
