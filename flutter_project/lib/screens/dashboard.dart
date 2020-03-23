import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:weather/weather.dart';

import 'package:flutter_project/services/authservice.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _position;
  String _address;
  // Weather _weather;

  @override
  void initState() {
    super.initState();
    _getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            if(_position != null)
              Text("LAT: ${_position.latitude}, LNG: ${_position.longitude}"),
            if(_address != null)
              Text(_address),
            // if(_weather != null)
            //   Text("${_weather.temperature.celsius}°C"),
            RaisedButton(
              child: Text('Sair'),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  _getPosition() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _position = position;
      });

      _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddress() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _position.latitude, _position.longitude);

      Placemark place = p[0];

      setState(() {
        _address =
          "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}