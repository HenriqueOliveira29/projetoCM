import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/controller/db.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha, String name, String phone,
      String university) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
      FirebaseFirestore db = await DBFirestore.get();
      await db.collection("users").doc(usuario!.uid).set({
        'email': email.toString(),
        'phone': phone.toString(),
        'name': name.toString(),
        'university': university.toString(),
        'uid': usuario!.uid,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw AuthException("Senha muito fraca");
      } else if (e.code == "email-already-in-use") {
        throw AuthException("Este email ja esta em uso");
      } else {
        throw AuthException(e.code);
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toString(), password: senha.toString());
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AuthException("Email nao encontrado");
      } else if (e.code == "wrong-password") {
        throw AuthException("Senha incorreta. Tente novamente");
      } else {
        throw AuthException(e.code);
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
