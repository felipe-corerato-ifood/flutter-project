import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/screens/phone_auth.dart';
import '../widgets/tochable_opacity.dart';

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

  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  void _onFormSubmit() {
    signIn(_emailField.toString(), _passwordField.toString());
  }

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
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
                    TextFormField(
                      controller: _emailField,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        hintText: 'Email'
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 64),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Senha'
                        ),
                        obscureText: true,
                      ),
                    ),

                    TouchableOpacity(
                      child: Container(
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
                      onPress: _onFormSubmit,
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
                            child: TouchableOpacity(child: 
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.facebookF), 
                                color: Colors.grey[700],
                                onPressed: null, 
                              ),
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
                            child: TouchableOpacity(
                              child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.google), 
                                color: Colors.grey[700],
                                onPressed: null, 
                              ),
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
                            child: TouchableOpacity(
                              child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.phone), 
                                color: Colors.grey[500],
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context, 
                                    isScrollControlled: true,
                                    builder: (BuildContext bc) {
                                      return PhoneLogin();
                                    }  
                                  );
                                }, 
                              ),
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
