import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/core/utils/icons_extension.dart';

import 'package:news_app/core/utils/widget_extension.dart';
import 'package:news_app/models/articles_response.dart';

import 'package:news_app/ui/home/widgets/article_bottom_sheet.dart';
import 'package:news_app/ui/home/widgets/article_card.dart';

class SearchLayout extends StatefulWidget {
  static const String route = '/search';
  final List<Source> sources;

  const SearchLayout({required this.sources, super.key});

  @override
  State<SearchLayout> createState() => _SearchLayoutState();
}

class _SearchLayoutState extends State<SearchLayout> {
  final TextEditingController searchController = TextEditingController();
  final ApiManager apiManager = ApiManager();
  String get source => widget.sources.map((e) => e.id).join(',');

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(width: 1),
                ),
                prefixIcon: Icons.search.toIcon,
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  icon: Icons.close.toIcon,
                ),
              ),
            ).allPadding(16),

            Expanded(
              child: FutureBuilder(
                future: apiManager.searchArticles(
                  query: searchController.text,
                  sources: source,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.articles!.isEmpty) {
                    return Center(child: Text('No articles found.'));
                  } else {
                    final articles = snapshot.data!.articles;
                    return ListView.builder(
                      itemCount: articles!.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              builder: (_) =>
                                  ArticleBottomShee(article: article),
                            );
                          },
                          child: ArticleCard(article: article).allPadding(16),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}