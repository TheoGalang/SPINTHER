import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future login(String email, String password) async {
    setLoading(true);
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      setLoading(false);
      return user;
    } on SocketException {
      setMessage("No internet,  please connect to internet");
      setLoading(false);
    } catch (e) {
      setMessage(e.toString());
      setLoading(false);
    }
    notifyListeners();
  }

  Future register(String email, String password) async {
    try {
      setLoading(true);
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      // firebaseFirestore
      //     .collection("user")
      //     .doc(user!.uid)
      //     .set({'uid': user.uid, 'email': user.email, 'role': role});
      setLoading(false);
      return user;
    } on SocketException {
      setMessage("No internet,  please connect to internet");
      setLoading(false);
    } catch (e) {
      setMessage(e.toString());
      setLoading(false);
    }
    notifyListeners();
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(val) {
    _errorMessage = val;
    notifyListeners();
  }

  Stream<User?> get user =>
      firebaseAuth.authStateChanges().map((event) => event);
}
