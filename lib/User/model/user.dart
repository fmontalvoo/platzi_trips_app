import 'package:platzi_trips_app/Place/model/place.dart';

class User {
  String _uid;
  String _nombre;
  String _email;
  String _foto;
  List<Place> _myPlaces;
  List<Place> _myFavoritePlaces;

  User(
      {String uid,
      String nombre,
      String email,
      String foto,
      List<Place> myPlaces,
      List<Place> myFavoritePlaces}) {
    this._uid = uid;
    this._nombre = nombre;
    this._email = email;
    this._foto = foto;
    this._myPlaces = myPlaces;
    this._myFavoritePlaces = myFavoritePlaces;
  }

  set setUID(String uid) => this._uid = uid;
  String get getUID => this._uid;

  set setNombre(String nombre) => this._nombre = nombre;
  String get getNombre => this._nombre;

  set setEMail(String email) => this._email = email;
  String get getEMail => this._email;

  set setFoto(String foto) => this._foto = foto;
  String get getFoto => this._foto;

  set setMyPlaces(List<Place> myPlaces) => this._myPlaces = myPlaces;
  List<Place> get getMyPlaces => this._myPlaces;

  set setMyFavoritePlaces(List<Place> myFavoritePlaces) =>
      this._myFavoritePlaces = myFavoritePlaces;
  List<Place> get getMyFavoritePlaces => this._myFavoritePlaces;
}
