import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../locator.dart';

/// Blocs
import '../../blocs/post/bloc.dart';
import '../../blocs/post/postResult.dart';

/// Domain
import '../../domain/models/model/post.dart';

/// Resources
import '../../resources/dataHandler.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final BaseRepository baseRepository = locator<BaseRepository>();

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostVerileriGetir) {
      yield* _mapKategorilerVerileriGetirToState();
    }
  }

  Stream<PostState> _mapKategorilerVerileriGetirToState() async* {
    yield PostLoadingState();

    try {
      final List<PostModel> postList = await baseRepository.postListGetir();
      final PostResult result = PostResult(postList: postList);
      yield PostLoadedState(result: result);
    } catch (_) {
      yield PostErrorState();
    }
  }
}
