import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/features%20/allnews/presentation/bloc/discovernewsbloc/discovernews_bloc.dart';
import 'package:weatherapp/features%20/category_enum.dart';

class Showcategory extends StatelessWidget {

  const Showcategory({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Category.values;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: category.map<Widget>((cat) {
          final name = cat.name[0].toUpperCase() + cat.name.substring(1);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                context.read<DiscovernewsBloc>().add(FetchCategoryNewsEvent(category: cat));
              },
              child: Text(name),
            ),
          );
        }).toList(),
      ),
    );
  }
}
