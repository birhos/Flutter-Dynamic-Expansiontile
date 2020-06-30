import 'package:flutter/material.dart';

/// Domain
import '../../domain/models/model/post.dart';
import '../../domain/models/model/comment.dart';

/// Resources
import '../../resources/helper/httpHelper.dart';
import '../../resources/service/dataService.dart';

class RealDataService implements BaseDataService {
  final HttpHelper _apiHelper = HttpHelper();

  @override
  Future<List<PostModel>> postListGetir() async {
    final List<dynamic> responseJson = await _apiHelper.get("https://jsonplaceholder.typicode.com/posts");
    final List<PostModel> liste = responseJson
        .map((tekGonderiMap) => PostModel.fromJson(tekGonderiMap))
        .cast<PostModel>()
        .toList();
    return liste;
  }

  @override
  Future<List<CommentModel>> postCommentListGetir({@required String postId}) async {
    final List<dynamic> responseJson = await _apiHelper.get("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    final List<CommentModel> liste = responseJson
        .map((tekGonderiMap) => CommentModel.fromJson(tekGonderiMap))
        .cast<CommentModel>()
        .toList();
    return liste;
  }
}
