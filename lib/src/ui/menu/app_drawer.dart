import 'package:flutter/material.dart';
import 'package:my_app/src/ui/search/search.dart';

import '../movie_category.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: [
         _createHeader(),
         _createDrawerItem(
            icon: Icons.movie_creation,
           text: 'Movie category',
           onTap: () {
             // Update the state of the app
             // ...
             // Then close the drawer
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(
                     builder: (context) => MovieCategory()));
           },
         ),

         _createDrawerItem(
           icon: Icons.search,
           text: 'Search',
           onTap: () {
             // Update the state of the app
             // ...
             // Then close the drawer
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(
                     builder: (context) => Search()));
           },
         ),

       ],
     ),
   );
  }


  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/drawer_header_background.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Movie Information",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }


  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

}