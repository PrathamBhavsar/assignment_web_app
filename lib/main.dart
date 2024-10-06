import 'package:assignment_web_app/home_screen.dart';
import 'package:assignment_web_app/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:assignment_web_app/firebase_options.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/posts/:postId',
        builder: (context, state) {
          final postId = state.pathParameters['postId']!;

          // You can keep the previous check for extra if needed
          if (state.extra == null) {
            return PostDetailScreen(
              postId: postId, // Pass the postId here
              userName: 'Unknown User',
              userAccount: 'unknown_account',
              time: 'N/A',
              postContent: Text('No content available.'),
              isLiked: false,
              toggleisLiked: () {},
            );
          }

          final postDetails = state.extra as Map<String, dynamic>;

          return PostDetailScreen(
            postId: postId, // Pass the postId here as well
            userName: postDetails['userName'] ?? 'Unknown User',
            userAccount: postDetails['userAccount'] ?? 'unknown_account',
            time: postDetails['time'] ?? 'N/A',
            postContent:
                postDetails['postContent'] ?? Text('No content available.'),
            isLiked: postDetails['isLiked'] ?? false,
            toggleisLiked: postDetails['toggleisLiked'] ?? () {},
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Error: ${state.error}')),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      restorationScopeId: 'app',
    );
  }
}
