import 'package:equatable/equatable.dart';

/// Blocs
import '../../blocs/post/postResult.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class InitialPostState extends PostState {
  @override
  String toString() => 'PostState | InitialAnaSayfaState';
}

class PostLoadingState extends PostState {
  @override
  String toString() => 'PostState | PostLoadingState';
}

class PostLoadedState extends PostState {
  final PostResult result;

  const PostLoadedState({this.result});

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'PostState | PostLoadedState';
}

class PostErrorState extends PostState {
  @override
  String toString() => 'PostState | PostErrorState';
}
