// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:news_app/core/utils/app_assets.dart';

class NewsCategory {
  final String id;
  final String name;
  final String imageLight;
  final String imageDark;
  final String? image;

  NewsCategory({
    required this.name,
    required this.imageLight,
    required this.imageDark,
    required this.id,
    this.image,
  });

  String get categoryName => name;
  String get categoryImage => image ?? imageLight;

  static List<NewsCategory> getCategories({bool isDark = false}) {
    return categories.map((category) {
      return NewsCategory(
        id: category.id,
        name: category.name,
        imageLight: category.imageLight,
        imageDark: category.imageDark,
        image: isDark ? category.imageDark : category.imageLight,
      );
    }).toList();
  }

  static List<NewsCategory> categories = [
    NewsCategory(
      id: 'general',
      name: 'General',
      imageLight: AppAssets.generalLight,
      imageDark: AppAssets.generalDark,
    ),
    NewsCategory(
      id: 'business',
      name: 'Business',
      imageLight: AppAssets.businessLight,
      imageDark: AppAssets.businessDark,
    ),
    NewsCategory(
      id: 'sports',
      name: 'Sports',
      imageLight: AppAssets.sportsLight,
      imageDark: AppAssets.sportsDark,
    ),
    NewsCategory(
      id: 'technology',
      name: 'Technology',
      imageLight: AppAssets.technologyLight,
      imageDark: AppAssets.technologyDark,
    ),
    NewsCategory(
      id: 'entertainment',
      name: 'Entertainment',
      imageLight: AppAssets.entertainmentLight,
      imageDark: AppAssets.entertainmentDark,
    ),
    NewsCategory(
      id: 'health',
      name: 'Health',
      imageLight: AppAssets.healthLight,
      imageDark: AppAssets.healthDark,
    ),
    NewsCategory(
      id: 'science',
      name: 'Science',
      imageLight: AppAssets.scienceLight,
      imageDark: AppAssets.scienceDark,
    ),
  ];
}