import 'package:assignment_web_app/text_posts.dart';
import 'package:assignment_web_app/video_posts.dart';
import 'package:assignment_web_app/image_posts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> icons = [
    BottomNavigationBarItem(
      icon: Icon(Icons.text_snippet_outlined),
      label: 'Text',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.image_outlined),
      label: 'Image',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_camera_back_outlined),
      label: 'Video',
    )
  ];
  List<String> titles = ['Text', 'Image', 'Video'];

  List<Widget> pages = [TextPostsPage(), ImagePostsPage(), VideoPostsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titles[_currentIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: icons,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
        body: pages[_currentIndex]);
  }
}
