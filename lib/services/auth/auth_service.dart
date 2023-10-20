// ignore_for_file: slash_for_doc_comments

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  /**
   * to use functions and property for auth and firestore
   */

  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // instance of firestore
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  // sign user in
  Future<UserCredential> signInWithEmailedPassword({
    String? email,
    password,
  }) async {
    try {
      // sing in
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email.toString(),
        password: password,
      );

      _firebaseStore.collection('user').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
          'password': password,
        },
        SetOptions(
          merge: true,
        ),
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign user out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  // create a new user
  Future<UserCredential> signUpWithEmailedPassword(
      {String? email, password, userName}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password,
      );
      // after create the user, create a new document for the user in the users collection
      _firebaseStore.collection('user').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'password': password,
        'userName': userName,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
