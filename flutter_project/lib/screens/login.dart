import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Color primaryRed = const Color.fromRGBO(234, 29, 44, 1);

  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/login_banner.png",
              width: double.maxFinite,
              height: 240,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              top: 100,
              left: 30,
              child:
                Text('Sign in', 
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white
                  )
                )
            ),
            Positioned(
              top: 180,
              child: Container(
                padding: EdgeInsets.all(32),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)
                  )
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Username'
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 64),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Password'
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: primaryRed,
                        borderRadius: BorderRadius.all(
                          Radius.circular(32)
                        ),
                      ),
                      child: Center(
                        child: Text('LOGIN', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10), 
                      child: Text("Forgot your Password?", style: TextStyle(color: Colors.grey))
                    ),

                    Container(height: 50),                    

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(100))
                          ),
                          child: Center(
                            child: Icon(Icons.face,
                              color: Colors.grey[700]
                            ),
                          ),
                        ),

                        Container(width: 50),

                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(100))
                          ),
                          child: Center(
                            child: Icon(Icons.fingerprint,
                              color: Colors.grey[700]
                            ),
                          ),
                        ),
                      ],
                    ), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
