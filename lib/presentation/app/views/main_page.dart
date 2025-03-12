import 'package:divar_aviz/config/constants/assets_route.dart';
import 'package:divar_aviz/presentation/app/widgets/responsive_container.dart';
import 'package:divar_aviz/presentation/promotion/views/add_promotion_page.dart';
import 'package:divar_aviz/presentation/promotion/views/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  int _selectedBottomNavigationItem = 4;

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedBottomNavigationItem,
          children: const [
            ProfilePage(),
            CategoryPage(),
            AddPromotionPage(),
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
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildNavItems {
    return [
      BottomNavigationBarItem(
        label: 'پروفایل',
        icon: _getNavIcon('profile'),
        activeIcon: _getNavIcon('profile_colored'),
      ),
      BottomNavigationBarItem(
        label: 'دسته بندی',
        icon: _getNavIcon('category'),
        activeIcon: _getNavIcon('category_colored'),
      ),
      BottomNavigationBarItem(
        label: 'افزودن آگهی',
        icon: _getNavIcon('add'),
        activeIcon: _getNavIcon('add_colored'),
      ),
      BottomNavigationBarItem(
        label: 'جستجو',
        icon: _getNavIcon('search'),
        activeIcon: _getNavIcon('search_colored'),
      ),
      BottomNavigationBarItem(
        label: 'خانه',
        icon: _getNavIcon('home'),
        activeIcon: _getNavIcon('home_colored'),
      ),
    ];
  }

  Padding _getNavIcon(String name) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SvgPicture.asset(
        getSvg(name),
      ),
    );
  }
}
