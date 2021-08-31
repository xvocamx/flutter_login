import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String name, String phone, String password,Function onSucess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
          _createUser(user.user.uid, name, phone,onSucess);
      print(user);
    }).catchError((onError) {
      //TODO
    });
  }
  Future<void> signIn(String email,String password){
    return  this._firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());

  }

  _createUser(String userID, String name, String phone, Function onSucess) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userID).set(user).then((user) {
      onSucess();
    }).catchError((onError) {
      //TODO
    });
  }
  Future logout() async{
    await _firebaseAuth.signOut();
  }
}
