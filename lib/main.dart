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
          // Here you would fetch the relevant post data if needed
          return PostDetailScreen(
            userName: 'User Name', // Replace with actual data
            userAccount: 'user35475', // Replace with actual data
            time: '9', // Replace with actual data
            postContent:
                Text('Content for post $postId'), // Placeholder content
            isLiked: false, // Replace with actual data
            toggleisLiked: () {}, // Implement if needed
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

      restorationScopeId: 'app', // Add restorationScopeId to enable restoration
    );
  }
}
