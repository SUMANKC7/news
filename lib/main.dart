import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bottom_navigation_bar.dart';
import 'package:weatherapp/core/services/apiclient.dart';
import 'package:weatherapp/features%20/allnews/data/repository/newsrepository.dart';
import 'package:weatherapp/features%20/allnews/data/services/newsservices.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/allnewsbloc/allnews_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/discovernewsbloc/discovernews_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/searchnewsbloc/searchnewsbloc_bloc.dart';

void main() {
  final apiClient = Apiclient();
  final newsServices = Newsservices(apiClient);
  final newsRepository = NewsRepository(newsServices);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AllnewsBloc(newsRepository)
               ,
        ),
        BlocProvider(create: (context)=>DiscovernewsBloc(newsRepository)),
        BlocProvider(create: (context)=>SearchnewsblocBloc(newsRepository)),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PresistantBottomNavBar());
  }
}
