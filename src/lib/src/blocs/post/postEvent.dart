import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostVerileriGetir extends PostEvent {
  @override
  String toString() => 'PostEvent | PostVerileriGetir';
}
