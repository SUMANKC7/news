import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';

class DetailPage extends StatelessWidget {
  final AllnewsModel data;
  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent.withValues(alpha: 0.3),
          ),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.backgroundColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.transparent.withValues(alpha: 0.3),
            ),
            icon: Icon(
              Icons.bookmark_outline_rounded,
              color: AppColors.backgroundColor,
            ),
          ),
          SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.transparent.withValues(alpha: 0.3),
            ),
            icon: Icon(
              Icons.more_horiz_outlined,
              color: AppColors.backgroundColor,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.network("${data.urlToImage}", fit: BoxFit.cover),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.38,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Hello"),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.backgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}

String timeAgo(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp).toLocal();
  Duration diff = DateTime.now().difference(dateTime);

  if (diff.inSeconds < 60) return "${diff.inSeconds}s ago";
  if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
  if (diff.inHours < 24) return "${diff.inHours}h ago";
  if (diff.inDays < 7) return "${diff.inDays}d ago";

  return "${(diff.inDays / 7).floor()}w ago";
}
