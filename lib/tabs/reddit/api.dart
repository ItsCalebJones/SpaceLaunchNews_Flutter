import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:space_launch_news/serializers.dart';
import 'package:space_launch_news/tabs/reddit/post.dart';
import 'package:space_launch_news/util.dart';

const String baseUrl = 'https://www.reddit.com/r/AndroidDev/';
const String topPostsUrl = 'top.json?count=25';

Future<List<Article>> getTopPosts() async {
  final response = await http.get(Url.baseUrl(baseUrl, topPostsUrl));

  Posts posts =
      serializers.deserializeWith(Posts.serializer, json.decode(response.body));

  return posts.data.children.map((PostData postData) => postData.data).toList();
}
