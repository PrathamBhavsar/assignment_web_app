import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    super.key,
    required this.postId, // Add postId as a parameter
    required this.userName,
    required this.userAccount,
    required this.time,
    required this.postContent,
    required this.isLiked,
    required this.toggleisLiked,
  });

  final String postId; // New parameter for postId
  final String userName;
  final String userAccount;
  final String time;
  final Widget postContent;
  final bool isLiked;
  final void Function() toggleisLiked;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late String userName;
  late String userAccount;
  late String time;
  late Widget postContent;
  late bool isLiked;

  @override
  void initState() {
    super.initState();

    // Retrieve the post details based on postId
    _loadPostDetails();
  }

  void _loadPostDetails() {
    // Fetch the post details based on the postId
    // This could be from a local database, an API, or hardcoded for now
    // Example: Assuming you have a function to get post details
    Map<String, dynamic> postDetails = getPostDetailsById(widget.postId);

    userName = postDetails['userName'] ?? 'Unknown User';
    userAccount = postDetails['userAccount'] ?? 'unknown_account';
    time = postDetails['time'] ?? 'N/A';
    postContent = postDetails['postContent'] ?? Text('No content available.');
    isLiked = postDetails['isLiked'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post by $userName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rest of your UI using userName, userAccount, time, and postContent
          ],
        ),
      ),
    );
  }

  // Mock function to get post details by postId
  Map<String, dynamic> getPostDetailsById(String postId) {
    // This is just a placeholder. Replace this with your actual data fetching logic.
    return {
      'userName': 'User Name for $postId',
      'userAccount': 'user_account_for_$postId',
      'time': '5 min ago',
      'postContent': Text('Content for post $postId'),
      'isLiked': false,
    };
  }
}
