import 'package:flutter/material.dart';
import 'package:newspaper/state_management/news_data.dart';
import 'package:provider/provider.dart';
import './screens/splash_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsData>.value(
          value: NewsData(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.white,
          primaryColor: Colors.red,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
