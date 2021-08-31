import 'package:flutter/material.dart';
import 'package:login/src/resources/signin.dart';
import 'package:login/src/blocs/auth_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _confirmPassController = new TextEditingController();


  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "My app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                    child: StreamBuilder(
                      stream: authBloc.emailStream,
                      builder: (context, snapshot) => TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Email",
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xff606470),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      ),
                    )),
                StreamBuilder(
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelText: "Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff606470),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StreamBuilder(
                    stream: authBloc.phoneStream,
                    builder: (context, snapshot) => TextField(
                      controller: _phoneController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: "Phone",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xff606470),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: authBloc.passStream,
                  builder: (context, snapshot) => TextField(
                    controller: _passController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xff606470),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StreamBuilder(
                    stream: authBloc.confirmPassStream,
                    builder: (context, snapshot) => TextField(
                      controller: _confirmPassController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: "Confirm Passowrd",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff606470),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: RaisedButton(
                      onPressed: _onSignUpClicked,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Color(0xffb1877f2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSignUpClicked() {
    var isValid = authBloc.isValid(_emailController.text, _nameController.text, _phoneController.text, _passController.text, _confirmPassController.text);
    if(isValid){
      authBloc.signUp(_emailController.text, _nameController.text, _phoneController.text, _passController.text,(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
      });
    }
  }
}
