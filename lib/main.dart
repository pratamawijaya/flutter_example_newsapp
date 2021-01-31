import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapp_example/data/repository/article_repository.dart';
import 'package:flutter_newsapp_example/injector.dart';
import 'package:flutter_newsapp_example/screens/homepage/bloc/homepage_cubit.dart';
import 'package:flutter_newsapp_example/screens/homepage/home_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomepageCubit(locator<ArticleRepository>()),
        child: HomeScreen(),
      ),
    );
  }
}
