import 'package:flutter/material.dart';
import 'package:gestion_menu_ussd/Screens/accueil_page.dart';

import 'Screens/choix_page.dart';
import 'Screens/transfert_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TransfertScrren(),

    );
  }
}


