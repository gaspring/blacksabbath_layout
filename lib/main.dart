// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _myApp createState() => new _myApp();
}

class _myApp extends State<MyApp> {
  List<IconData> list = new List();

  @override
  Widget build(BuildContext context) {
    list.add(Icons.turned_in_not);
    list.add(Icons.music_video);
    list.add(Icons.stop_screen_share);
    list.add(Icons.star_border);


      Widget titleSection = Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Black Sabbath',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'About the band',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),

            new IconButton(
              onPressed: () {
              if (list[3] == Icons.star) {
                setState (() {
                  list[3] = Icons.star_border;
                });
              } else {
                setState(() {
                  list[3] = Icons.star;
                });
               }
             },
              icon: new Icon(list[3], color: Colors.indigo),
            ),
            Text('99876'),
          ],
        ),
      );

      Column buildButtonColumn(int index, IconData icon, IconData troca, String label,
          {bool ativo = true}) {
        Color color = Theme.of(context).primaryColor;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (ativo) {
                  if (list[index] == icon) {
                    setState(() {
                      list[index] = troca;
                    });
                  } else {
                    setState(() {
                      list[index] = icon;
                    });
                  }
                }
              },
              icon: new Icon(list[index], color: Colors.indigo),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        );
      }

      Widget buttonSection = Container(
        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          // Cross = altura da linha
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // O spaceEvenly irá distribuir os itens igualmente no espaço especificado
          // Main = caso seja linha (Row), será a parte maior.
          // Main = caso seja coluna, será
          children: [
            buildButtonColumn(0, Icons.turned_in_not, Icons.turned_in, 'SAVE'),
            buildButtonColumn(1, Icons.music_video, Icons.library_music, 'SONGS'),
            buildButtonColumn(2, Icons.stop_screen_share, Icons.screen_share, 'SHARE'),
          ],
        ),
      );

      Widget textSection = Container(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          '''
Black Sabbath were an English rock band, formed in Birmingham in 1968, by guitarist and main songwriter Tony Iommi, bassist and main lyricist Geezer Butler, drummer Bill Ward and singer Ozzy Osbourne. Black Sabbath are often cited as pioneers of heavy metal music.[1] The band helped define the genre with releases such as Black Sabbath (1970), Paranoid (1970) and Master of Reality (1971). The band had multiple line-up changes, with Iommi being the only constant member throughout its history.
        ''',
          softWrap: true,
        ),
      );


      return MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.indigo,
            title: Text('Rock Bands'),
          ),
          body: ListView(
            children: [
              Image.asset(
                  'assets/sabas.jpg',
                  width: 600.0,
                  height: 240.0,
                  fit: BoxFit.cover
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          ),
        ),
      );
    }
  }
