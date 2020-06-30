import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CommentVerileriGetir extends CommentEvent {
  final String postId;

  const CommentVerileriGetir({this.postId});

  @override
  List<Object> get props => [postId];

  @override
  String toString() => 'CommentEvent | CommentVerileriGetir';
}
