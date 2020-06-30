import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/locator.dart';
import 'src/multiProviders.dart';

/// App
import 'src/app/anaSayfa.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: multiProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaSayfa(),
    );
  }
}
