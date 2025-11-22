// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/allnewsbloc/allnews_bloc.dart';

class ShowCarouselSlider extends StatelessWidget {
  const ShowCarouselSlider({super.key, required this.onPageChanged});
  final Function(int) onPageChanged;

  final int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllnewsBloc, AllnewsState>(
      builder: (context, state) {
        if (state is Allnewsloading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RecommendedNewsLoaded) {
          final List<AllnewsModel> articles = state.articles;
          return CarouselSlider.builder(
            itemCount: articles.length,
            itemBuilder: (context, index, realIndex) {
              final article = articles[index];

              return Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SizedBox.expand(
                            child: Image.network(
                              article.urlToImage ?? "",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    color: Colors.grey.shade300,
                                    child: const Icon(Icons.broken_image),
                                  ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 7,
                          right: 9,
                          top: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize:
                                      MainAxisSize.min, // Changed to min
                                  children: [
                                    // Author row with flexible constraints
                                    Row(
                                      children: [
                                        Flexible(
                                          // Changed from Flexible to Expanded
                                          child: Text(
                                            article.author ?? "Unknown Author",
                                            style: TextStyle(
                                              fontSize: 14, // Slightly smaller
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.backgroundColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primaryColor,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // Title with more constrained space
                                    Expanded(
                                      // Added Expanded to prevent overflow
                                      child: Text(
                                        article.title ?? "No Title",
                                        style: TextStyle(
                                          fontSize: 15, // Slightly smaller
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.backgroundColor,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: 175,
              viewportFraction: 0.77,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (index, reason) {
                onPageChanged(index);
              },
            ),
          );
        }
        if (state is NewsError) {
          return Center(child: Text(state.messege));
        }

        return const SizedBox();
      },
    );
  }
}
