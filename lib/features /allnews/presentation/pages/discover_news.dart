import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/allnews_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/pages/search_news.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/homepage_widget/recommended_news.dart';
import 'package:weatherapp/features%20/category_enum.dart';

class DiscoverNews extends StatefulWidget {
  const DiscoverNews({super.key});

  @override
  State<DiscoverNews> createState() => _DiscoverNewsState();
}

class _DiscoverNewsState extends State<DiscoverNews> {
  
  // List<AllnewsModel> articles = [];
  final categorytype = Category.values;
  Category selectedcategory = Category.general;
  @override
  void initState() {
    super.initState();
    context.read<AllnewsBloc>().add(
      FetchCategoryNewsEvent(category: selectedcategory),
    );
  }

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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchNews()),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: const [
                      Icon(Icons.search_rounded, size: 26),
                      SizedBox(width: 10),
                      Text("Search news...", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => SearchNews()),
              //     );
              //   },
              //   child: Container(
              //     height: 50,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: AppColors.textSecondary.withValues(alpha: 0.2),
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: Padding(
              //             padding: EdgeInsets.only(left: 10),
              //             child: TextFormField(
              //               decoration: InputDecoration(
              //                 border: InputBorder.none,
              //                 focusedBorder: InputBorder.none,
              //                 icon: Icon(
              //                   Icons.search_rounded,
              //                   size: 30,
              //                   color: AppColors.textSecondary,
              //                 ),
              //                 hintText: "Search",
              //                 hintStyle: TextStyle(
              //                   color: AppColors.textSecondary,
              //                 ),
              //               ),
              //               controller: queryController,
              //             ),
              //           ),
              //         ),
              //         IconButton(
              //           onPressed: () {},
              //           icon: Icon(
              //             Icons.filter_list,
              //             color: AppColors.textSecondary,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // Showcategory(),
              _buildcategoryTiles(),
              BlocBuilder<AllnewsBloc, AllnewsState>(
                builder: (context, state) {
                  if (state is Allnewsloading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is Newsloaded) {
                    final List<AllnewsModel> articles = state.articles;
                    return ShowRecommendedNews(articles: articles);
                  }
                  if (state is NewsError) {
                    return Text("Error; ${state.messege}");
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildcategoryTiles() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categorytype.map<Widget>((cat) {
          final name = cat.name[0].toUpperCase() + cat.name.substring(1);
          final isSelected = cat == selectedcategory;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedcategory = cat;
                });
                context.read<AllnewsBloc>().add(
                  FetchCategoryNewsEvent(category: cat),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: isSelected
                    ? AppColors
                          .primaryColor // selected color
                    : Colors.grey.shade200, // default color
                foregroundColor: isSelected
                    ? Colors.white
                    : AppColors.textSecondary,
              ),
              child: Text(name),
            ),
          );
        }).toList(),
      ),
    );
  }
}
