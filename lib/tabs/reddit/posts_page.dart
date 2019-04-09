import 'dart:async';
import 'package:space_launch_news/tabs/reddit/api.dart';
import 'package:space_launch_news/tabs/reddit/post.dart';
import 'package:space_launch_news/tabs/reddit/posts_tile.dart';
import 'package:space_launch_news/util.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  PostsPage({Key key}) : super(key: key);

  static const String routeName = "/posts";

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Article> _posts = [];

  @override
  void initState() {
    super.initState();
    getTopPosts().then((posts) {
      setState(() {
        _posts = posts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final postListTiles = _posts.map((post) {
      return PostListTile(post, () => UrlLauncher.launchUrl(post.url));
    }).toList();

    return RefreshIndicator(
        child: AnimatedCrossFade(
            firstChild: Center(child: CircularProgressIndicator()),
            secondChild: ListView(children: postListTiles),
            crossFadeState: _posts.isEmpty
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 200)),
        onRefresh: _onRefresh);
  }

  Future<List<Article>> _onRefresh() {
    return getTopPosts();
  }
}
