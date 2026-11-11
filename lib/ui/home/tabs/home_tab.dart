import 'package:flutter/material.dart';
import 'package:news_app/core/provider/app_config_provider.dart';
import 'package:news_app/core/utils/context_extention.dart';
import 'package:news_app/core/utils/numbers_extension.dart';
import 'package:news_app/core/utils/widget_extension.dart';
import 'package:news_app/models/news_category.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  final void Function(NewsCategory category) onCategoryClick;

  const HomeTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    var categories = NewsCategory.getCategories(isDark: provider.isDarkMode);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SafeArea(
          top: true,
          bottom: false,
          child: Text(
            "Good Morning\nHere is Some News For You",
            style: context.text.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        16.verticalSpace,
        for (int i = 0; i < categories.length; i++)
          _buildCategoryCard(categories[i], i, context, onCategoryClick),
      ],
    );
  }

  Widget _buildCategoryCard(
    NewsCategory category,
    int index,
    BuildContext context,
    void Function(NewsCategory) onClick,
  ) {
    final bool isOdd = index % 2 != 0;

    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            onClick(category);
          },
          child: Stack(
            alignment: isOdd ? Alignment.centerLeft : Alignment.centerRight,
            children: [
              Image.asset(
                category.categoryImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ).clip(24),
              Column(
                crossAxisAlignment: isOdd
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Text(
                    category.categoryName,
                    style: context.text.titleLarge!.copyWith(
                      color: context.colors.surface,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  24.verticalSpace,
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.45,
                      minWidth: 140,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.surface.withAlpha(80),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isOdd)
                          Container(
                            decoration: BoxDecoration(
                              color: context.colors.surface,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(14),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                              color: context.colors.primary,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            "View All",
                            style: context.text.titleLarge?.copyWith(
                              color: context.colors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ).horizontalPadding(8),
                        ),
                        if (!isOdd)
                          Container(
                            decoration: BoxDecoration(
                              color: context.colors.surface,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(14),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: context.colors.primary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ).allPadding(16),
            ],
          ),
        ),
        16.verticalSpace,
      ],
    );
  }
}