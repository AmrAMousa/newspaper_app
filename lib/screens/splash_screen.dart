import 'dart:async';

import 'package:flutter/material.dart';
import '../screens/main_page_drawer.dart';

import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _connectionStatus = false;
  _checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _connectionStatus = false;
      });

      print(' I am not connected to a network.');
    } else if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        _connectionStatus = true;
      });
      print(' I am connected to a wifi network.');
      Timer(
          Duration(milliseconds: 750),
              () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPageDrawer(),
            ),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: _connectionStatus
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Image.asset('images/rewind-time.png'),
                  Text(
                    'Newspaper',
                    style: TextStyle(
                      fontFamily: 'Cinzel',
                      fontWeight: FontWeight.w300,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Powered by NewsAPI',
                    style: TextStyle(
                      fontFamily: 'Playfair_Display',
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Image.asset('images/rewind-time.png'),
                  Text(
                    'Newspaper',
                    style: TextStyle(
                      fontFamily: 'Cinzel',
                      fontWeight: FontWeight.w300,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Powered by NewsAPI',
                    style: TextStyle(
                      fontFamily: 'Playfair_Display',
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(top:32.0),
                child: Text(
                  'you are not connected to the internet',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      _checkConnectivity();
                    },
                    child: Text('Retry',style: TextStyle(color: Colors.white),),
                  ),
                ],
              )),
        ));
  }
}
