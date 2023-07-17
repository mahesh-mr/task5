import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task5/controller/controller/bottam_nav_controller.dart';
import 'package:task5/controller/controller/controller.dart';
import 'package:task5/controller/controller/search_controll.dart';
import 'package:task5/view/screen/home_screen.dart';

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
          create: (context) => ProductProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
          ChangeNotifierProvider(
          create: (context) => BottomNavBarProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Product App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}
