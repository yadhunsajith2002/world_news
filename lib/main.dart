import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/controller/bottom_navi.dart';
import 'package:world_news/controller/news_api_controller.dart';
import 'package:world_news/screens/screen_home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => Bottomcontroller(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenHome(),
      ),
    );
  }
}
