import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/context_extention.dart';
import 'package:news_app/core/utils/widget_extension.dart';
import 'package:news_app/models/articles_response.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        spacing: 16,
        mainAxisAlignment: .start,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? '',
            placeholder: (_, _) => Image.asset(
              context.appConfig.isDarkMode
                  ? AppAssets.logoDark
                  : AppAssets.logoLight,
            ),
            errorWidget: (_, _, _) => Image.asset(
              context.appConfig.isDarkMode
                  ? AppAssets.logoDark
                  : AppAssets.logoLight,
            ),
            width: .infinity,
            height: 200,
            fit: .cover,
            imageBuilder: (_, imageProvider) =>
                Image(image: imageProvider).clip(16),
          ),
          Text(article.title ?? '', style: context.text.labelLarge),
          Row(
            children: [
              Expanded(
                child: Text(
                  article.author ?? '',
                  style: context.text.labelLarge,
                ),
              ),

              Text(article.publishedAt ?? '', style: context.text.labelLarge),
            ],
          ),
        ],
      ),
    );
  }
}