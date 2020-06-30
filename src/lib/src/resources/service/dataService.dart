import 'package:flutter/material.dart';

/// Domain
import '../../../src/domain/models/model/post.dart';
import '../../../src/domain/models/model/comment.dart';

abstract class BaseDataService {
  Future<List<PostModel>> postListGetir();

  Future<List<CommentModel>> postCommentListGetir({@required String postId});
}
