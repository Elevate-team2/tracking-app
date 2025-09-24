import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/home_page.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/order_page.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/profile_page.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int _page = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: _page);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            _page = newPage;
          });
        },

        children: [HomePage(), OrderPage(), ProfilePage()],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: (value) {
          setState(() {
            _pageController.animateToPage(
              value,
              duration: Duration(milliseconds: 200),
              curve: Curves.decelerate,
            );
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, key: Key(Constants.homeKey)),
            label: context.loc.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, key: Key(Constants.orderkey)),
            label: context.loc.orders,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, key: Key(Constants.profileKey)),
            label: context.loc.profile,
          ),
        ],
      ),
    );
  }
}
