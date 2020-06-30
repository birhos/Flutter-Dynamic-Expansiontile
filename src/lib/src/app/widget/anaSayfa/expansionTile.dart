part of '../../../app/anaSayfa.dart';

class _ExpansionTile extends StatefulWidget {
  final int id;
  final String title;
  final Color color;

  const _ExpansionTile({
    Key key,
    @required this.id,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  @override
  State createState() => new _ExpansionTileState();
}

class _ExpansionTileState extends State<_ExpansionTile> {
  CommentListBloc commentListBloc;
  bool isExpanded = false;

  @override
  void initState() {
    commentListBloc = BlocProvider.of<CommentListBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.white,
        dividerTheme: DividerThemeData(
          color: Colors.white,
        ),
      ),
      child: customExpansionTile.ExpansionTile(
        backgroundColor: Colors.transparent,
        headerBackgroundColor: Colors.transparent,
        iconColor: widget.color,
        onExpansionChanged: (status) {
          if (status == true) {
            sayfaVeriGetir();
          }

          if (mounted) {
            setState(() {
              isExpanded = status;
            });
          }
        },
        title: Container(
          transform: Matrix4.translationValues(-30, 0, 0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: isExpanded ? widget.color : Colors.black,
            ),
          ),
        ),
        children: <Widget>[
          blocBuilder,
        ],
        leading: Container(
          color: widget.color,
          width: 10.0,
          margin: EdgeInsets.symmetric(vertical: 5.0),
        ),
      ),
    );
  }

  BlocBuilder<CommentListBloc, CommentState> get blocBuilder {
    return BlocBuilder<CommentListBloc, CommentState>(
      bloc: commentListBloc,

      // ignore: missing_return
      builder: (BuildContext context, CommentState state) {
        if (state is InitialCommentListState) {
          return SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CommentLoadingState) {
          return SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CommentLoadedState) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: state.result.commentList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  bottom: index == state.result.commentList.length - 1 ? 8.0 : 0.0,
                ),
                child: ListTile(
                  dense: true,
                  title: Text(
                    state.result.commentList[index].body,
                  ),
                  leading: Text(
                    state.result.commentList[index].id.toString(),
                  ),
                  onTap: () {
                    //
                  },
                ),
              );
            },
          );
        }

        if (state is CommentListErrorState) {
          return Center(
            child: Text(
              "Hata Oluştu.",
            ),
          );
        }
      },
    );
  }

  void sayfaVeriGetir() {
    commentListBloc.add(
      CommentVerileriGetir(
        postId: widget.id.toString(),
      ),
    );
  }
}
