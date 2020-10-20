import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ListItem.dart';

class HeadingItem implements ListItem{
  final String heading;

  HeadingItem(this.heading);



  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(heading,
    style: Theme.of(context).textTheme.headline5
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    // TODO: implement buildTitle
    throw UnimplementedError();
  }
  
}