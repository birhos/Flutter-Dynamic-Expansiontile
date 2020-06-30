import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Blocs
import '../blocs/post/bloc.dart';
import '../blocs/comment/bloc.dart';

/// Core
import '../core/widgets/customExpansionTile.dart' as customExpansionTile;

part 'widget/anaSayfa/expansionTile.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => new _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  PostBloc postBloc;

  @override
  void initState() {
    postBloc = BlocProvider.of<PostBloc>(context);
    sayfaVeriGetir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dynamic ExpansionTile',
        ),
      ),
      body: blocBuilder,
    );
  }

  BlocBuilder<PostBloc, PostState> get blocBuilder {
    return BlocBuilder<PostBloc, PostState>(
      bloc: postBloc,

      // ignore: missing_return
      builder: (BuildContext context, PostState state) {
        if (state is InitialPostState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PostLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PostLoadedState) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: state.result.postList.length,
            itemBuilder: (BuildContext context, int index) {
              return BlocProvider<CommentListBloc>(
                create: (BuildContext context) => CommentListBloc(),
                child: _ExpansionTile(
                  color: randomColor(),
                  id: int.parse(state.result.postList[index].id.toString()),
                  title: state.result.postList[index].title,
                ),
              );
            },
          );
        }

        if (state is PostErrorState) {
          return Center(
            child: Text(
              "Hata Oluştu.",
            ),
          );
        }
      },
    );
  }

  final Random rnd = math.Random();

  Color randomColor() => Color(rnd.nextInt(0xffffffff));

  void sayfaVeriGetir() {
    postBloc.add(PostVerileriGetir());
  }
}
