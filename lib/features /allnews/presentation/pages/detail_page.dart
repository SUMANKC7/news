import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/detailpage/bookmark.dart';

class DetailPage extends StatefulWidget {
  final AllnewsModel data;
  const DetailPage({super.key, required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent.withValues(alpha: 0.3),
          ),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.backgroundColor,
          ),
        ),
        actions: [
          BookmarkButton(article: widget.data),
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
                height: MediaQuery.of(context).size.height * 0.55,
                width: double.infinity,
                child: Image.network(
                  "${widget.data.urlToImage}",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 50,
                left: 7,
                right: 9,
                top: MediaQuery.of(context).size.height * 0.28,
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  widget.data.author ?? "Unknown Author",
                                  style: TextStyle(
                                    fontSize: 17,
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

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data.title ?? "No Title",
                                  style: TextStyle(
                                    fontSize: 18, // Slightly smaller
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.backgroundColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.fiber_manual_record,
                                      color: AppColors.backgroundColor,
                                      size: 10,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      timeAgo("${widget.data.publishedAt}"),
                                      style: TextStyle(
                                        color: AppColors.backgroundColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.4,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          final urlString = widget.data.url;
                                          if (urlString == null ||
                                              urlString.isEmpty) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "No URL available",
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          final uri = Uri.tryParse(urlString);
                                          if (uri == null) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text("Invalid URL"),
                                              ),
                                            );
                                            return;
                                          }

                                          try {
                                            if (!await launchUrl(
                                              uri,
                                              mode: LaunchMode
                                                  .externalApplication,
                                            )) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "Could not open link",
                                                  ),
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text("Error: $e"),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.link_rounded,
                                              color: AppColors.backgroundColor,
                                            ),
                                            Text(
                                              "Full news",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppColors.backgroundColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
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
                  child: Padding(padding: const EdgeInsets.all(16.0)),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.backgroundColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 10,
                  horizontal: 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        widget.data.title ?? "No Title",
                        style: TextStyle(
                          fontSize: 22, // Slightly smaller
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 40),
                      Text(
                        "${widget.data.content}",
                        style: TextStyle(
                          fontSize: 17, // Slightly smaller
                          fontWeight: FontWeight.normal,
                          color: AppColors.textPrimary,
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
