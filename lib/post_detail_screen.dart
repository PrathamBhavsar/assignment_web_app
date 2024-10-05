import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    super.key,
    required this.userName,
    required this.userAccount,
    required this.time,
    required this.postContent,
    required this.isLiked,
    required this.toggleisLiked,
  });

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post by ${widget.userName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('@${widget.userAccount}',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                Spacer(),
                Text('${widget.time} min ago', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: widget.postContent),
          ],
        ),
      ),
    );
  }
}
