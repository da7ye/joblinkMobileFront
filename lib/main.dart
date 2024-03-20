
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_service.dart';
import 'package:flutter_application_1/screens/homePage.dart';



void main() async {
  var categories = await APIServices.getCategories();
  // var providers = await APIServices.getProviders();

  // print(providers);

  runApp(MyApp(categories: categories));
}

class MyApp extends StatelessWidget {
  final List<dynamic> categories;

  MyApp({required this.categories});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Specialties',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(categories: categories),
    );
  }
}
