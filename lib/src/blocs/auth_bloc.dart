import 'dart:async';

import 'package:login/src/fire_base/fire_base_auth.dart';

class AuthBloc {
  var _auth = FireAuth();

  StreamController _emailController = new StreamController();
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _confirmPassController = new StreamController();

  Stream get emailStream => _emailController.stream;

  Stream get nameStream => _nameController.stream;

  Stream get phoneStream => _phoneController.stream;

  Stream get passStream => _passController.stream;

  Stream get confirmPassStream => _confirmPassController.stream;

  bool isValid(String email, String name, String phone, String pass,
      String comfirmPass) {
    if (email == null || email.length == 0) {
      _emailController.sink.addError("Nhập email");
      return false;
    }
    _emailController.sink.add("");

    if (name == null || name.length == 0) {
      _nameController.sink.addError("Nhập tên");
      return false;
    }
    _nameController.sink.add("");

    if (phone == null || phone.length < 10) {
      _phoneController.sink.addError("Số điện thoại phải trên 10 ký tự");
      return false;
    }
    _phoneController.sink.add("");

    if (pass == null || pass.length < 6) {
      _passController.sink.addError("Mật khẩu phải trên 5 ký tự");
      return false;
    }
    _passController.sink.add("");

    if (comfirmPass == null || comfirmPass.length < 6) {
      _confirmPassController.sink.addError("Mật khẩu phải trên 5 ký tự");
      return false;
    }
    _confirmPassController.sink.add("");

    if (pass != comfirmPass) {
      _confirmPassController.sink.addError("Mật khẩu không trùng nhau");
      return false;
    }
    _confirmPassController.sink.add("");

    return true;
  }

  void signUp(String email, String name, String phone, String password,
      Function onSucess) {
    _auth.signUp(email, name, phone, password, onSucess);
  }

  void dispose() {
    _emailController.close();
    _nameController.close();
    _phoneController.close();
    _passController.close();
    _confirmPassController.close();
  }
}
