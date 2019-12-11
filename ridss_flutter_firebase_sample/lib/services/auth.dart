import 'package:firebase_auth/firebase_auth.dart';
import 'package:ridss_flutter_firebase_sample/models/user.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
// create user object based on firebase user
    User _userFromFirebaseUser(FirebaseUser user) {
      return user != null ? User(uid : user.uid) : null;
    }

// auth change user stream

Stream<FirebaseUser> get user {
  return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
}

  // signin with auth

Future signInAnoyn() async {
  try {
    AuthResult result =  await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }
  catch(e){
    print(e.toString());
    return null;
  }
}

  // sign in with gmail

  // sign in with email and password


  // signout

}