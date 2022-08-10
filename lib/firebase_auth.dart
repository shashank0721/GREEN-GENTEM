import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'fire_store.dart';

// import 'package:greengentem/services/Firebase/fireAuth/google_auth.dart'
//     as google_auth;

final FirebaseAuth _auth = FirebaseAuth.instance;

// Anonymous sign in
Future<UserCredential> signInAnon() async {
  UserCredential result = await _auth.signInAnonymously();
  return result;
}

// google sign in
// Future<bool> signInWithGoogle() async {
//   UserCredential result = await google_auth.signInWithGoogle();
//   CollectionReference users = usersCollectionReference();

//   if (!(await users.doc(result.user!.email).get()).exists) {
//     initialData();
//   }

//   return (result.user!.uid == _auth.currentUser!.uid);
// }

// Email pass sign in
Future<List<dynamic>> signInUser(
    {required String email, required String password}) async {
  if (email == '' && password == '') {
    return [-1, 'Some error'];
  }
  try {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return [1, 'No user found for that email'];
    } else if (e.code == 'wrong-password') {
      return [2, 'Wrong password provided for that user'];
    }
  }
  // Successful sign in
  return [0, ''];
}

// New register
Future<List<dynamic>> registerUser(
    {required String email, required String password}) async {
  try {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return [2, 'The password provided is too weak'];
    } else if (e.code == 'email-already-in-use') {
      return [1, 'The account already exists for that email'];
    }
  }

  // Successful registration

  initialData();

  return [0, ''];
}

// Get current user id
String getCurrentUserId() {
  if (checkLoggedIn()) {
    return _auth.currentUser!.email as String;
  }
  return "none";
}

// Get the current user
User getCurrentUser() {
  return _auth.currentUser!;
}

// Check if there is any login
bool checkLoggedIn() {
  User? user = _auth.currentUser;
  return (user != null);
}

// Sign out user
Future<bool> signOut() async {
  await _auth.signOut();
  return !checkLoggedIn();
}

// google sign out
// Future<bool> signOutGoogle() async {
//   await google_auth.signOutGoogle();
//   return !checkLoggedIn();
// }

// Setup initial data
void initialData() async {
  CollectionReference users = usersCollectionReference();
  await users.doc(_auth.currentUser!.email).set({
    "email": _auth.currentUser!.email,
  });
}