import 'package:assignment_web_app/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:assignment_web_app/constants/app_constants.dart';

class ImagePostsPage extends StatefulWidget {
  const ImagePostsPage({super.key});

  @override
  State<ImagePostsPage> createState() => _ImagePostsPageState();
}

class _ImagePostsPageState extends State<ImagePostsPage> {
  List<bool> isLikedList = List.generate(10, (index) => false);

  _toggleisLiked(int index) {
    setState(() {
      isLikedList[index] = !isLikedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.appPadding,
      child: ListView.builder(
        itemCount: isLikedList.length,
        itemBuilder: (context, index) {
          return PostWidget(
            isLiked: isLikedList[index],
            postContent: Image.asset(
              'assets/profile.png',
              fit: BoxFit.cover,
            ),
            time: '${index + 1}',
            userAccount: 'user$index',
            userName: 'User$index',
            toggleisLiked: () => _toggleisLiked(index),
          );
        },
      ),
    );
  }
}
