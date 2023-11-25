import 'package:flutter/material.dart';
import 'package:method_channel_lucas/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Teste method',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
