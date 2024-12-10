import 'package:flutter/material.dart';
import 'package:gestion_menu_ussd/services/auth_service.dart';
import 'package:gestion_menu_ussd/widgets/constcolor.dart';
import 'connection_page.dart';

class AcceuilPage extends StatefulWidget {
  const AcceuilPage({super.key});

  @override
  State<AcceuilPage> createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: CustomColor.heigth(context),
              child:Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset("assets/images/img.png",
                      fit: BoxFit.cover,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Text(
                            'BIENVENUE',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height:CustomColor.heigth(context)*0.58),

                          Custombutton(nom:"Inscrit toi avec ton mail",image:"assets/images/google_img.png",couleur_fond:Colors.green,couleur_text: Colors.white,onPressed: AuthService.signInWithGoogle),
                          Custombutton(nom:"Inscrit toi avec google",image:"assets/images/google_img.png",couleur_fond:Colors.white,couleur_text: Colors.black,onPressed: AuthService.signInWithGoogle),

                          SizedBox(
                              height:CustomColor.heigth(context)*0.1,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Scrren_Connection()));
                                },
                                child: RichText(
                                    text:TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "compte deja existante ?",
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.black
                                          ),
                                        ),
                                        TextSpan(
                                          text: "connect toi",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.green
                                          ),
                                        )
                                      ]
                                    ) ),

                              )
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              )


          )),
    );
  }
}

class Custombutton extends StatelessWidget {

  final String nom;
  final  String image;
  final Color couleur_text,couleur_fond;
  final VoidCallback onPressed;


  const Custombutton({
    super.key,
    required this.nom,
    required this.image,
    required this.couleur_text,
    required this.couleur_fond,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 75,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: couleur_fond,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 34,
                height: 34,
              ),
              SizedBox(width: 10),
              Text(
                nom,
                style: TextStyle(fontSize: 23, color: couleur_text),
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}
