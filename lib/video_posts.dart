import 'package:assignment_web_app/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:assignment_web_app/constants/app_constants.dart';

class VideoPostsPage extends StatefulWidget {
  const VideoPostsPage({super.key});

  @override
  State<VideoPostsPage> createState() => _VideoPostsPageState();
}

class _VideoPostsPageState extends State<VideoPostsPage> {
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
          String postId = 'video_post_$index'; // Generate unique postId

          return PostWidget(
            isLiked: isLikedList[index],
            postContent: Icon(
              Icons.video_collection_rounded,
              size: 60,
              color: Colors.blue,
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
