import 'package:assignment_web_app/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:assignment_web_app/constants/app_constants.dart';

class TextPostsPage extends StatefulWidget {
  const TextPostsPage({super.key});

  @override
  State<TextPostsPage> createState() => _TextPostsPageState();
}

class _TextPostsPageState extends State<TextPostsPage> {
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
          // Create a unique postId for each post, e.g., using the index
          String postId = 'post_$index';

          return PostWidget(
            isLiked: isLikedList[index],
            postContent: Text(
              'This is a sample text post #${index + 1}',
              style: TextStyle(fontSize: 22),
            ),
            time: '${index + 1}',
            userAccount: 'user$index',
            userName: 'User$index',
            toggleisLiked: () => _toggleisLiked(index),
            postId: postId, // Pass the unique postId
          );
        },
      ),
    );
  }
}
