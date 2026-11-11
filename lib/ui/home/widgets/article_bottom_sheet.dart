import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/context_extention.dart';
import 'package:news_app/core/utils/widget_extension.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:url_launcher/url_launcher.dart';



class ArticleBottomShee extends StatelessWidget {
  final Article article;
  const ArticleBottomShee({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SafeArea(
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
            Expanded(
              child: Text(
                article.content ?? '',
                style: context.text.titleMedium!.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
                textAlign: .start,
              ),
            ),
            FilledButton(
              onPressed: () async {
                String rawUrl = article.url ?? '';
                rawUrl = rawUrl.replaceAll('https%3A', 'https://');
                await launchUrl(
                  Uri.parse(rawUrl),
                  mode: LaunchMode.externalApplication,
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: context.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                minimumSize: Size(.infinity, 56),
              ),
              child: Text(
                'View Full Article',
                style: context.text.titleLarge!.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ).allPadding(16),
      ),
    );
  }
}