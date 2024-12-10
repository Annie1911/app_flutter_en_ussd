import 'package:flutter/material.dart';
import 'package:gestion_menu_ussd/services/auth_service.dart';

import 'operation_ussd_page.dart';

class ChoixScrren extends StatelessWidget {
  const ChoixScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Opérateur pour le transfert de votre argent"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, size: 40),
            onPressed: () => AuthService.logout(context),
          )
        ],
        backgroundColor: Colors.blueGrey.withOpacity(1),
        elevation: 0,
      ),
      body: Container(

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OperationUssdScreen()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/avatar.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Text(
                      "TOGOCEL",
                      style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OperationUssdScreen()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/avatar.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Text(
                      "MOOV",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
