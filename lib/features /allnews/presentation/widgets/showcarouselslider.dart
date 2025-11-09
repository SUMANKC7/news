import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/allnews_bloc.dart';

class ShowCarouselSlider extends StatelessWidget {
  const ShowCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllnewsBloc, AllnewsState>(
      builder: (context, state) {
        if (state is Allnewsloading) {
          return CircularProgressIndicator();
        }
        if (state is Newsloaded) {
          final List<AllnewsModel> articles = state.articles;
          return CarouselSlider.builder(
            itemCount: articles.length,
            itemBuilder: (context, index, realIndex) {
              final article = articles[index];
              return Container(
                margin: EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Image.network(article.urlToImage??"",fit: BoxFit.cover,width: double.infinity,errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey.shade300,child: Icon(Icons.broken_image),),),

                    ],
                  )
                ),
              );
            },
            options: CarouselOptions(
              height: 190,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
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
