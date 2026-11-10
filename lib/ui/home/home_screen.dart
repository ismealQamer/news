import 'package:flutter/material.dart';
import 'package:news/models/news_category.dart';
import 'package:news/ui/home/tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsCategory? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedCategory ==null? HomeTab():SizedBox() ,
    );
  }
}
