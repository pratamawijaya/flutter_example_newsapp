import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapp_example/screens/homepage/bloc/homepage_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().getTopHeadlines("technology", "us");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Hello"),
            ],
          ),
        ),
      ),
    );
  }
}
