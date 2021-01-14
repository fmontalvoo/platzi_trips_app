import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = AuthAPI();
  Future<FirebaseUser> singInFirebase() => _firebaseAuthAPI.signIn();

  void signOut() => _firebaseAuthAPI.signOut();
}
