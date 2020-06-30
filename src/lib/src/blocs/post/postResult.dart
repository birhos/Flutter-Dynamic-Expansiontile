import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Domain
import '../../domain/models/model/post.dart';

@immutable
class PostResult extends Equatable {
  final List<PostModel> postList;

  PostResult({
    @required this.postList,
  });

  @override
  List get props => [postList];
}
