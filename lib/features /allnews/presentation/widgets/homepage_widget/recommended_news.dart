// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';

class ShowRecommendedNews extends StatelessWidget {
  final List<AllnewsModel> articles;
  const ShowRecommendedNews({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ListView.builder(
      itemCount: articles.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = articles[index];
        DateTime parseDate = DateTime.parse(data.publishedAt ?? "");
        final formattedDate = DateFormat("MMM d, yyyy").format(parseDate);
        return Container(
          margin: EdgeInsets.only(right: 10, bottom: 15),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: size.height * 0.12,
                  width: size.width * 0.27,
                  child: Image.network(
                    data.urlToImage!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) {
                      return Icon(
                        Icons.image_not_supported,
                        color: AppColors.textSecondary,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    // SizedBox(height: 5),
                    Text(
                      "${data.title}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.person_pin_circle_outlined,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                        Expanded(
                          child: Text(
                            "${data.author}",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Text(
                          formattedDate,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
