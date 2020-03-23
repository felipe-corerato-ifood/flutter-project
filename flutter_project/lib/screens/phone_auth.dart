import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_project/screens/otp.dart';

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final Color primaryRed = const Color.fromRGBO(234, 29, 44, 1);
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 11) {
      updateState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
      return Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.7,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            Text(
              'Entrar/Registrar-se',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
                autofocus: true,
                onChanged: (text) {
                  validate(state);
                },
                decoration: InputDecoration(
                  labelText: "Digite seu número de celular",
                  prefix: Container(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "+55",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                autovalidate: true,
                autocorrect: false,
                maxLengthEnforced: true,
                validator: (value) {
                  return !isValid
                      ? 'Por favor digite um celular válido'
                      : null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: SizedBox(
                  width:
                      MediaQuery.of(context).size.width *
                          0.85,
                  child: RaisedButton(
                    color: primaryRed,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0.0)),
                    child: Text(
                      !isValid
                          ? "DIGITE SEU CELULAR"
                          : "CONFIRMAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (isValid) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OTPScreen(
                                mobileNumber:
                                    _phoneNumberController
                                        .text,
                              ),
                            ));
                      } else {
                        validate(state);
                      }
                    },
                    padding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
