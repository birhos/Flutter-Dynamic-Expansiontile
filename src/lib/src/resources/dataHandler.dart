import 'package:flutter/material.dart';

import '../locator.dart';

/// Domain
import '../domain/models/model/post.dart';
import '../domain/models/model/comment.dart';

/// Resources
import '../resources/service/dataService.dart';
import '../resources/service/realDataService.dart';

class BaseRepository {
  BaseDataService baseService;

  BaseRepository() {
    baseService = locator<RealDataService>();
  }

  Future<List<PostModel>> postListGetir() async {
    return await baseService.postListGetir();
  }

  Future<List<CommentModel>> postCommentListGetir({@required String postId}) async {
    return await baseService.postCommentListGetir(postId: postId);
  }
}
