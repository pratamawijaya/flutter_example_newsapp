import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapp_example/domain/article.dart';
import 'package:flutter_newsapp_example/screens/homepage/bloc/homepage_cubit.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().getTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Container(
        child: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            if (state is HomepageLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomepageLoaded) {
              return _buildListData(context, state.articles);
            } else {
              return Center(
                child: Text("Kosong"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildListData(BuildContext context, List<Article> articles) {
    return LazyLoadScrollView(
      onEndOfPage: () {
        context.read<HomepageCubit>().loadMore();
      },
      child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return _newsTile(articles[index]);
          }),
    );
  }

  ListTile _newsTile(Article article) {
    return ListTile(
      title: Text(
        article.title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
