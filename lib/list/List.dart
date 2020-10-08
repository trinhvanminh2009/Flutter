import 'package:flutter/material.dart';

import 'ListItem.dart';

class ListText extends StatelessWidget{
  final List<ListItem>items;

  const ListText({Key key, this.items}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final title = "Mixed List";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            final item = items[index];
            return ListTile(
              title: item.buildSubTitle(context),
              subtitle: item.buildSubTitle(context),
            );
          },
        ),
      ),
    );
  }

}