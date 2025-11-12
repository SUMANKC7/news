// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:weatherapp/core/theme/colors.dart';

class CarouselPageIndicator extends StatelessWidget {
  final int activeIndex;
  final int itemcount;
  const CarouselPageIndicator({
    super.key,
    required this.activeIndex,
    required this.itemcount,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: itemcount,
      effect: WormEffect(
        activeDotColor: AppColors.primaryColor,
        dotWidth: 10,
        dotHeight: 10,
      ),
    );
  }
}
