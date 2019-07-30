import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provide/secondPage.dart';
import 'package:provide/provide.dart';

import 'myProvide.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Provide<MyProvide>(
              builder: (context, child, provide) {
                return Text(
                  '阅读人数：' + '${provide.getNum}',
                  style: TextStyle(fontSize: 30.0),
                );
              },
            ),
            Provide<MyProvide>(
              builder: (context, child, provide) {
                return IconButton(
                  icon: Provide.value<MyProvide>(context).getIsFavorite
                      ? Icon(Icons.favorite, size: 50)
                      : Icon(Icons.favorite_border, size: 50),
                  onPressed: () {
                    Provide.value<MyProvide>(context).changeFavorite(
                        !Provide.value<MyProvide>(context).getIsFavorite);
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new SecondPage()),
          );
        },
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}
