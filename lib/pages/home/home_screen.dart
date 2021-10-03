import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/home/components/search_field.dart';
import 'package:app_mobile/pages/home/components/slide_posts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: mediumSize),
      child: Column(
        children: [
          SearchField(),
          SizedBox(height: mediumSize),
          SlidePosts(),
        ],
      ),
    ));
  }
}
