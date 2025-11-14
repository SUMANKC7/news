import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/allnews_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/discoverpage_widget/showcategory.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/homepage_widget/recommended_news.dart';

class DiscoverNews extends StatefulWidget {
  const DiscoverNews({super.key});

  @override
  State<DiscoverNews> createState() => _DiscoverNewsState();
}

class _DiscoverNewsState extends State<DiscoverNews> {
  final TextEditingController queryController = TextEditingController();
  List<AllnewsModel> articles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: AppColors.buttonBackground,
          ),
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "News from all around the world",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textSecondary,
                ),
              ),

              SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            icon: Icon(
                              Icons.search_rounded,
                              size: 30,
                              color: AppColors.textSecondary,
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          controller: queryController,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              Showcategory(),
              BlocListener<AllnewsBloc, AllnewsState>(
                listener: (context, state) {
                  if (state is Newsloaded) {
                    setState(() {
                      articles = state.articles;
                    });
                  }
                },
                child: ShowRecommendedNews(articles: articles),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
