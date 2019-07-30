import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'myProvide.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '这是第二个页面',
              style: TextStyle(fontSize: 30.0, color: Colors.red),
            ),
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
          Provide.value<MyProvide>(context).addNum();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
