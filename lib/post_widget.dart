import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for Clipboard
import 'package:assignment_web_app/constants/app_constants.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.toggleisLiked,
    required this.userName,
    required this.userAccount,
    required this.time,
    required this.postContent,
    required this.isLiked,
    required this.postId, // New parameter for unique post ID
  });

  final String userName;
  final String userAccount;
  final String time;
  final Widget postContent;
  final bool isLiked;
  final void Function() toggleisLiked;
  final String postId; // New parameter

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  void _sharePost() async {
    String link =
        'https://assignmen-app.web.app/posts/${widget.postId}'; // Generate the link
    await Clipboard.setData(ClipboardData(text: link)); // Copy to clipboard
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Link copied: $link')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate and pass the data
        context.go(
          '/posts/${widget.postId}',
          extra: {
            'userName': widget.userName,
            'userAccount': widget.userAccount,
            'time': widget.time,
            'postContent': widget.postContent,
            'isLiked': widget.isLiked,
            'toggleisLiked': widget.toggleisLiked,
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: AppConstants.appPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/profile.png'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.userName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '@${widget.userAccount}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '${widget.time} min ago',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                widget.postContent,
                SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.toggleisLiked();
                      },
                      child: widget.isLiked
                          ? Icon(Icons.favorite_rounded,
                              color: Colors.redAccent)
                          : Icon(Icons.favorite_border_rounded),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: _sharePost, // Call share function
                      child: Icon(Icons.share_rounded, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
