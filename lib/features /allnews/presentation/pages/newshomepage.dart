import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/colors.dart';

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Breaking News"),
              TextButton(onPressed: () {}, child: Text("View All")),
            ],
          ),
        ],
      ),
    );
  }
}
