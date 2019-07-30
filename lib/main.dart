import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'firstPage.dart';
import 'myProvide.dart';

void main() {
  //初始化
  var myProvide = MyProvide();
  var providers = Providers();
  //将myProvide加到providers中
  providers..provide(Provider.function((context) => myProvide));

  runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
