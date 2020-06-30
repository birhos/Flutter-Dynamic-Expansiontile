import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../locator.dart';

/// Blocs
import '../../blocs/comment/bloc.dart';
import '../../blocs/comment/commentResult.dart';

/// Domain
import '../../domain/models/model/comment.dart';

/// Resources
import '../../resources/dataHandler.dart';

class CommentListBloc extends Bloc<CommentEvent, CommentState> {
  final BaseRepository baseRepository = locator<BaseRepository>();

  @override
  CommentState get initialState => InitialCommentListState();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is CommentVerileriGetir) {
      yield* _mapKategoriListVerileriGetirToState(event.postId);
    }
  }

  Stream<CommentState> _mapKategoriListVerileriGetirToState(
      String postId) async* {
    yield CommentLoadingState();

    try {
      final List<CommentModel> commentList = await baseRepository.postCommentListGetir(postId: postId);
      final CommentResult result = CommentResult(commentList: commentList);
      yield CommentLoadedState(result: result);
    } catch (_) {
      yield CommentListErrorState();
    }
  }
}
