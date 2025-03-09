import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:divar_aviz/config/utils/dimentions.dart';
import 'package:divar_aviz/presentation/promotion/widgets/call_row_widget.dart';
import 'package:divar_aviz/presentation/promotion/widgets/description_tab_view.dart';
import 'package:divar_aviz/presentation/promotion/widgets/facilities_tab_view.dart';
import 'package:divar_aviz/presentation/promotion/widgets/price_tab_view.dart';
import 'package:divar_aviz/presentation/promotion/widgets/properties_tab_view.dart';
import 'package:flutter/material.dart';

class PromotionDetailTabsWidget extends StatefulWidget {
  const PromotionDetailTabsWidget({super.key});

  @override
  State<PromotionDetailTabsWidget> createState() =>
      _PromotionDetailTabsWidgetState();
}

class _PromotionDetailTabsWidgetState extends State<PromotionDetailTabsWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: Dimentions.sixteen),
      child: DefaultTabController(
        length: 4,
        initialIndex: 3,
        child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: CustomTabBarDelegate(
                  TabBar(
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    isScrollable: false,
                    labelStyle: textTheme.bodySmall,
                    padding:
                        const EdgeInsets.symmetric(vertical: Dimentions.six),
                    unselectedLabelColor: ColorPrimary.mainColor,
                    unselectedLabelStyle: textTheme.bodySmall,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius4),
                      color: ColorPrimary.mainColor,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimentions.six),
                        child: Text(
                          'توضیحات',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimentions.six),
                        child: Text(
                          'امکانات',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimentions.six),
                        child: Text(
                          'قیمت',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimentions.six),
                        child: Text(
                          'مشخصات',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          }),
          body: Column(
            children: [
              Expanded(
                child: _getScrollViewBody(textTheme),
              ),
              const SafeArea(
                minimum: EdgeInsets.only(bottom: Dimentions.egithteen),
                child: CallRowWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getScrollViewBody(textTheme) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: DescriptionTabView(),
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FacilitiesTabView(),
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PriceTabView(),
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PropertiesTabView(),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  CustomTabBarDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ColorPrimary.backgroundColor,
      child: _tabBar,
    );
  }

  @override
  // _tabBar.preferredSize.height: this line gets the best => default height for the tabbar widget.
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    //when the maxExtent or minExtent is dynamic it must be return true.
    return false;
  }
}
