import 'package:assignment_web_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.toggleisLiked,
    required this.userName,
    required this.userAccount,
    required this.time,
    required this.postContent,
    required this.isLiked,
  });

  final String userName;
  final String userAccount;
  final String time;
  final Widget postContent; // Changed from String to Widget
  final bool isLiked;
  final void Function() toggleisLiked;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  )
                ],
              ),
              SizedBox(height: 18),
              widget.postContent, // Displaying the content widget
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.toggleisLiked();
                    },
                    child: widget.isLiked
                        ? Icon(
                            Icons.favorite_rounded,
                            color: Colors.redAccent,
                          )
                        : Icon(Icons.favorite_border_rounded),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.share_rounded,
                        color: Colors.blueGrey,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
