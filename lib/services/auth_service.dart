import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_menu_ussd/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/connection_page.dart';



class AuthService{

  static final auth = FirebaseAuth.instance;

  static register_user(User_ges user) async {

    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.motpasse,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      return false;
    }

  }

  static login_user(String emailAddress, String motdepasse) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: emailAddress,
          password: motdepasse
      );
      return true ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }




  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

    static EmailReset(String email) async{
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email);
  }


  static Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');  // Suppression du token ou autre donnée d'authentification

    // Affichage d'un message de déconnexion
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Déconnexion réussie')),
    );

    // Optionnel : rediriger l'utilisateur vers la page de login ou accueil
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Scrren_Connection()),
    );
  }

}