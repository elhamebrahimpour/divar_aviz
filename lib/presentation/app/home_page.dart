import 'package:divar_aviz/presentation/aviz/pages/aviz_category_page.dart';
import 'package:flutter/material.dart';

import '../aviz/pages/advertisements_page.dart';
import '../aviz/pages/aviz_profile_page.dart';
import '../aviz/pages/aviz_search_page.dart';
import 'resources/theme_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomNavigationItem = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: const [
          AvizProfilePage(),
          CategoryPage(),
          AvizSearchPage(),
          AdvertisementsPage(),
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
        selectedItemColor: ColorBase.mainColor,
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall,
        unselectedItemColor: ColorBase.textGreyColor,
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
        items: _buildNavItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildNavItems {
    return [
      BottomNavigationBarItem(
        label: 'آویز من',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_profile.png'),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_profile_active.png'),
        ),
      ),
      BottomNavigationBarItem(
        label: 'افزودن آویز',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_add.png'),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_add_active.png'),
        ),
      ),
      BottomNavigationBarItem(
        label: 'جستجو',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/icon_search.png'),
        ),
        activeIcon: const Padding(
          padding: EdgeInsets.all(6.0),
          child: Icon(
            Icons.search,
            color: ColorBase.mainColor,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'آویز آگهی ها',
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/small_logo.png'),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/small_logo_colored.png'),
        ),
      ),
    ];
  }
}
