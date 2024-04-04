class MockCategoryUtil {
  static const List<String> mainCategories = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز',
  ];

  static const List<String> buildingRentItems = [
    'اجاره آپارتمان',
    'اجاره خانه',
  ];

  static const List<String> buildingSellItems = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
  ];

  static const List<String> companySellItems = [
    'فروش شرکت',
  ];

  static const List<String> companyRentItems = [
    'اجاره دفتر',
  ];

  static const List<String> dailyRentItems = [
    'اجاره روزانه',
  ];

  static const List<String> projectItems = [
    'پروژه ساخت مدرسه',
    'پروژه ساخت بیمارستان',
  ];
}

List<String> checkSubCategory(String selectedCategory) {
  switch (selectedCategory) {
    case 'اجاره مسکونی':
      return MockCategoryUtil.buildingRentItems;
    case 'فروش مسکونی':
      return MockCategoryUtil.buildingSellItems;
    case 'فروش دفاتر اداری و تجاری':
      return MockCategoryUtil.companySellItems;
    case 'اجاره دفاتر اداری و تجاری':
      return MockCategoryUtil.companyRentItems;
    case 'اجاره کوتاه مدت':
      return MockCategoryUtil.dailyRentItems;
    case 'پروژه های ساخت و ساز':
      return MockCategoryUtil.projectItems;
    default:
      return MockCategoryUtil.buildingRentItems;
  }
}
