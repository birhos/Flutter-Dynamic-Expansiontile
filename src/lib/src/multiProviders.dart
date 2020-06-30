import 'package:flutter_bloc/flutter_bloc.dart';

/// Blocs
import 'blocs/post/bloc.dart';

final List<BlocProvider> multiProviders = [
  BlocProvider<PostBloc>(
    create: (context) => PostBloc(),
  ),
];
