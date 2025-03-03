import 'package:divar_aviz/presentation/promotion/views/category_page.dart';
import 'package:flutter/material.dart';

import '../../promotion/views/home_page.dart';
import '../../../config/theme/theme_colors.dart';
import '../../promotion/views/profile_page.dart';
import '../../promotion/views/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedBottomNavigationItem = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: const [
          ProfilePage(),
          CategoryPage(),
          SearchPage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF9FAFB),
        elevation: 0,
        currentIndex: _selectedBottomNavigationItem,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectedBottomNavigationItem = index;
          });
        },
        selectedItemColor: ColorPrimary.mainColor,
        selectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedItemColor: ColorPrimary.textGreyColor,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        items: _buildNavItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildNavItems {
    return [
      BottomNavigationBarItem(
        label: 'پروفایل',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_profile.png'),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            'assets/images/icon_profile_active.png',
            color: ColorPrimary.mainColor,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'افزودن آگهی',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_add.png'),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            'assets/images/icon_add_active.png',
            color: ColorPrimary.mainColor,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'جستجو',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_search.png'),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            'assets/images/icon_search_active.png',
            color: ColorPrimary.mainColor,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'خانه',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            'assets/images/icon_home.png',
            scale: 2.6,
          ),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            'assets/images/icon_home_active.png',
            scale: 2.6,
          ),
        ),
      ),
    ];
  }
}
