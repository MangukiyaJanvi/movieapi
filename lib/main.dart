import 'package:flutter/material.dart';
import 'package:movieapi/screens/datascreen/view/data_screen.dart';
import 'package:movieapi/screens/datascreen/view/search_screen.dart';
import 'package:movieapi/screens/homescreen/provider/home_provider.dart';
import 'package:movieapi/screens/homescreen/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'data': (context) => DataScreen(),
          'search': (context) => SearchScreen(),
        },
      ),
    ),
  );
}
