import 'package:equatable/equatable.dart';

/// Blocs
import '../../blocs/comment/commentResult.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class InitialCommentListState extends CommentState {
  @override
  String toString() => 'CommentState | InitialCommentListState';
}

class CommentLoadingState extends CommentState {
  @override
  String toString() => 'CommentState | CommentLoadingState';
}

class CommentLoadedState extends CommentState {
  final CommentResult result;

  const CommentLoadedState({this.result});

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'CommentState | CommentLoadedState';
}

class CommentListErrorState extends CommentState {
  @override
  String toString() => 'CommentState | CommentListErrorState';
}
