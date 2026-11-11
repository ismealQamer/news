import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/core/utils/context_extention.dart';
import 'package:news_app/core/utils/icons_extension.dart';
import 'package:news_app/core/utils/numbers_extension.dart';
import 'package:news_app/core/utils/widget_extension.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/ui/home/tabs/home_tab.dart';
import 'package:news_app/ui/home/tabs/news_tab.dart';

import 'widgets/search_layout.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.categoryName,
        ),
        centerTitle: true,
        actions: [
          Visibility(
            visible: selectedCategory != null,
            child: IconButton(
              onPressed: () {
                _openSearch();
              },
              icon: Icons.search_rounded.toIcon,
            ),
          ),
        ],
      ),
      drawer: _drawer(),
      body: selectedCategory == null
          ? HomeTab(onCategoryClick: (category) => changeCategory(category))
          : NewsTab(category: selectedCategory!),
    );
  }

  void changeCategory(NewsCategory category) {
    selectedCategory = category;
    setState(() {});
  }

  Future<void> _openSearch() async {
    final category = selectedCategory;
    if (category == null) {
      return;
    }

    final response = await ApiManager().getSources(category.id);
    if (!mounted) {
      return;
    }

    Navigator.pushNamed(
      context,
      SearchLayout.route,
      arguments: response.sources ?? <Source>[],
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: .infinity,
            height: 240,
            alignment: .center,
            decoration: BoxDecoration(color: context.colorScheme.primary),
            child: Text(
              'News App',
              style: context.text.titleLarge!.copyWith(
                color: context.colorScheme.surface,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              selectedCategory = null;
              context.pop();
              setState(() {});
            },
            child: Row(
              children: [
                Icon(Icons.home_sharp, size: 32),
                16.verticalSpace,
                Text('Go to Home', style: context.text.titleLarge),
              ],
            ).allPadding(16),
          ),
          Divider(),
          Text('Theme', style: context.text.titleLarge).symmetricPadding(16, 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton<ThemeMode>(
              items: [
                DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
              ],
              value: context.appConfigListenFalse.themeMode,
              isExpanded: true,
              borderRadius: BorderRadius.circular(16),
              underline: SizedBox(),
              onChanged: (mode) {
                context.appConfigListenFalse.changeTheme(mode!);
              },
            ),
          ),
          16.verticalSpace,
          Divider(),
          Text(
            'Language',
            style: context.text.titleLarge,
          ).symmetricPadding(16, 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton<String>(
              items: [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'ar', child: Text('Arabic')),
              ],
              value: context.appConfigListenFalse.locale.languageCode,
              isExpanded: true,
              borderRadius: BorderRadius.circular(16),
              underline: SizedBox(),
              onChanged: (lang) {
                //todo add Arabic to the app
              },
            ),
          ),
        ],
      ),
    );
  }
}
