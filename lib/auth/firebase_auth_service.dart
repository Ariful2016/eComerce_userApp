import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;

  static Future<User?> loginUser(String email, String pass ) async{
    final result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return result.user;
  }
  static Future<User?> registerUser(String email, String pass ) async{
    final result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    return result.user;
  }

  static bool get isUserEmailVerified => _auth.currentUser!.emailVerified;

  static Future<void> sendVerificationMail() {
    return _auth.currentUser!.sendEmailVerification();
  }

  static Future<void> logoutUser(){
    return _auth.signOut();
  }


}