import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import '../screens/home_page.dart';

class MainPageDrawer extends StatefulWidget {
  @override
  _MainPageDrawerState createState() => _MainPageDrawerState();
}

class _MainPageDrawerState extends State<MainPageDrawer> {
  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    super.initState();

    items.add(ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Newspaper',
          baseStyle: TextStyle(fontFamily:'Cinzel',fontWeight: FontWeight.w300,color: Colors.white, fontSize: 28.0),
          colorLineSelected: Colors.red,
        ),
        HomePage('general',Colors.red[50])));

    items.add(ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Business',
          baseStyle: TextStyle(fontFamily:'Playfair_Display',fontWeight: FontWeight.w300 ,color: Colors.white, fontSize: 18.0),
          colorLineSelected: Colors.green,
        ),
        HomePage('business',Colors.green[50])));

    items.add(ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Entertainment',
          baseStyle: TextStyle(fontFamily:'Playfair_Display',fontWeight: FontWeight.w300 ,color: Colors.white, fontSize: 18.0),
          colorLineSelected: Colors.pink,
        ),
        HomePage('entertainment',Colors.pink[50])));

    items.add(ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Health',
          baseStyle: TextStyle(fontFamily:'Playfair_Display',fontWeight: FontWeight.w300 ,color: Colors.white, fontSize: 18.0),
          colorLineSelected: Colors.deepOrange,
        ),
        HomePage('health',Colors.deepOrange[50])));

    items.add(ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Science',
          baseStyle: TextStyle(fontFamily:'Playfair_Display',fontWeight: FontWeight.w300 ,color: Colors.white, fontSize: 18.0),
          colorLineSelected: Colors.cyan,
        ),
        HomePage('science',Colors.cyan[50])));

    items.add(ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Sports',
          baseStyle: TextStyle(fontFamily:'Playfair_Display',fontWeight: FontWeight.w300 ,color: Colors.white, fontSize: 18.0),
          colorLineSelected: Colors.purple,
        ),
        HomePage('sports',Colors.purple[50])));

    items.add(ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Technology',
          baseStyle: TextStyle(fontFamily:'Playfair_Display',fontWeight: FontWeight.w300 ,color: Colors.white, fontSize: 18.0),
          colorLineSelected: Colors.blue,
        ),
        HomePage('tech',Colors.blue[50])));
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.redAccent,
      backgroundColorAppBar: items[0].itemMenu.colorLineSelected,
      screens: items,
    );
  }
}
