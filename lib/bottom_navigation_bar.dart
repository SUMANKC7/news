import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:weatherapp/core/theme/colors.dart';
import 'package:weatherapp/features%20/allnews/presentation/pages/bookmarkpage.dart';
import 'package:weatherapp/features%20/allnews/presentation/pages/discover_news.dart';
import 'package:weatherapp/features%20/allnews/presentation/pages/newshomepage.dart';

class PresistantBottomNavBar extends StatefulWidget {
  const PresistantBottomNavBar({super.key});

  @override
  State<PresistantBottomNavBar> createState() => _PresistantBottomNavBarState();
}

class _PresistantBottomNavBarState extends State<PresistantBottomNavBar> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );
  List<Widget> _screens() {
    return [NewsHomePage(), DiscoverNews(), BookmarksPage()];
  }

  List<PersistentBottomNavBarItem> _items() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        activeColorPrimary: Colors.green,
        activeColorSecondary: AppColors.backgroundColor,

        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.public),
        title: "Discover",
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: AppColors.backgroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bookmark),
        title: "Bookmark",
        activeColorPrimary: Colors.green,
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        activeColorSecondary: AppColors.backgroundColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens(),
      items: _items(),
      backgroundColor: AppColors.backgroundColor,
      navBarStyle: NavBarStyle.style7, // experiment with style numbers
      decoration: NavBarDecoration(
        colorBehindNavBar: AppColors.buttonBackground,
      ),
    );
  }
}
