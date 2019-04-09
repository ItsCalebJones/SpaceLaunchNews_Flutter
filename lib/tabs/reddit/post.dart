library post;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post.g.dart';

abstract class Posts implements Built<Posts, PostsBuilder> {
  PostsData get data;

  Posts._();
  factory Posts([updates(PostsBuilder b)]) = _$Posts;
  static Serializer<Posts> get serializer => _$postsSerializer;
}

abstract class Article implements Built<Article, PostBuilder> {
  String get id;
  String get url;
  String get title;
  String get newsSite;
  String get newsSiteLong;
  String get feturedImage;
  double get datePublished; // ignore: non_constant_identifier_names

  Article._();
  factory Article([updates(PostBuilder b)]) = _$Post;
  static Serializer<Article> get serializer => _$postSerializer;

  domainName() {
    return url;
  }
}

