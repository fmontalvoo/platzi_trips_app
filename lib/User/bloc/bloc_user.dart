import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  Stream<FirebaseUser> _stream = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => _stream;

  Future<FirebaseUser> signIn() {
    return _authRepository.singInFirebase();
  }

  void signOut() {
    _authRepository.signOut();
  }

  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserData(User user) => _cloudFirestoreAPI.updateUserData(user);

  @override
  void dispose() {}
}
