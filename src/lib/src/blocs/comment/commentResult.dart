import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Domain
import '../../domain/models/model/comment.dart';

@immutable
class CommentResult extends Equatable {
  final List<CommentModel> commentList;

  CommentResult({
    @required this.commentList,
  });

  @override
  List get props => [commentList];
}
