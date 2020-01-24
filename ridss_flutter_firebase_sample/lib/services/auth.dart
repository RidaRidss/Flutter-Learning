import 'package:ridss_flutter_firebase_sample/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
// create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

// auth change user stream

// here is a stream writter for all firebase user

  // Stream<FirebaseUser> get user {
  //   return _auth.onAuthStateChanged;
  // }

// now we are going to writing the stream for users based on user model which we have already written

  Stream<User> get user {
   
    // return _auth.onAuthStateChanged.map((FirebaseUser user)=>_userFromFirebaseUser(user));

    // we can simply explicit the above function decoration by the below line of code
    // === the above functionality is implied =========
    
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
 
  }

  // signin with auth

// type future because its a async task

  Future signInAnoyn() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with gmail

  // sign in with email and password

  Future signInWithEmailNPassword(String email , String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email : email , password: password);
       FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(err) {
      print(err.toString());
      return null;
    }
  }


  // signout

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
