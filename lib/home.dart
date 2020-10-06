import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  List<Card> _buildGridCards(BuildContext context){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu, semanticLabel: 'menu'),
            onPressed: () {
              print('menu button');
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'search'),
            onPressed: () {
              print('search');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('filter');
            },
          )
        ],
        title: Text('Sun* Rewarding System'),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(6.0),
          childAspectRatio: 8.0 / 9.0,
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/diamond.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('title'),
                        SizedBox(height: 8.0),
                        Text('Secondary Text')
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
      resizeToAvoidBottomInset: false,
    );
  }
}
