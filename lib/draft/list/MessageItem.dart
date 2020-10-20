import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/draft/list/ListItem.dart';

class MessageItem implements ListItem{
  final String sender;
  final String body;


  MessageItem(this.sender, this.body);

  @override
  Widget buildSubTitle(BuildContext context) {
    // TODO: implement buildSubTitle
    return Text(sender);
  }

  @override
  Widget buildTitle(BuildContext context) {
    // TODO: implement buildTitle
    return Text(body);
  }
  
}