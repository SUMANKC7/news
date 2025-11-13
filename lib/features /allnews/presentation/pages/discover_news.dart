import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/presentation/widgets/discoverpage_widget/showcategory.dart';

class DiscoverNews extends StatelessWidget {
  const DiscoverNews({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _queryController = TextEditingController();
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
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                        ),
                        controller: _queryController,
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
          ],
        ),
      ),
    );
  }
}
