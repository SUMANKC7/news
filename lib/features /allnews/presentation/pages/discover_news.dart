import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/colors.dart';

class DiscoverNews extends StatelessWidget {
  const DiscoverNews({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _queryController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: AppColors.buttonBackground,
          ),
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),

      body: Column(
        children: [
          Text(
            "Discover",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "News from all around the world",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: AppColors.textSecondary,
            ),
          ),

          SizedBox(height: 20),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.2)
            ),
            child: Row(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Icon(Icons.search_rounded,color: AppColors.textSecondary,),
                    hintText: "Search"
                  ),
                  controller: _queryController,
                ),

                IconButton(onPressed: (){}, icon: Icon(Icons.filter_list,color: AppColors.textSecondary,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
