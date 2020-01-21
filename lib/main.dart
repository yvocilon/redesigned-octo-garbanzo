import 'package:flutter/cupertino.dart';

import 'home.dart';
import 'book.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            title: Text('Book'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bookmark),
            title: Text('Bookmark'),
          ),
        ]),
        tabBuilder: (BuildContext context, int index) {
          assert(index >= 0 && index <= 3);

          switch (index) {
            case 0:
              return Home();
            case 1:
              return Book();
            case 2:
              return SafeArea(child: Text("Tab three"));
          }
          return null;
        });
  }
}
