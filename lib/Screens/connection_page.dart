import 'package:flutter/material.dart';
import 'package:gestion_menu_ussd/widgets/constcolor.dart';
import 'package:gestion_menu_ussd/widgets/constinput.dart';
import 'package:gap/gap.dart';
import 'package:gestion_menu_ussd/services/auth_service.dart';
import 'accueil_page.dart';
import 'choix_page.dart';
import 'inscription_page.dart';


class Scrren_Connection extends StatefulWidget {
  const Scrren_Connection({super.key});

  @override
  State<Scrren_Connection> createState() => _Scrren_ConnectionState();
}

class _Scrren_ConnectionState extends State<Scrren_Connection> {



  @override
  Widget build(BuildContext context) {


    final form_Key =GlobalKey<FormState>();

    TextEditingController mailcontroller = TextEditingController();
    TextEditingController motdepassecontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AcceuilPage()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Connexion"),
      ),
      body:Container(
        height: CustomColor.heigth(context),
        decoration: BoxDecoration(
          color: CustomColor.background_color,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(25),
              Text("Inscription",style: TextStyle(color:Colors.white,fontSize: 26,fontWeight: FontWeight.bold)),
              Text("Inscription dtrsertdyugiho",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              Gap(20),
              Container(
                height: 225,
                width: double.infinity,
                child: Column(
                  children: [
                    Custombutton(nom:"Inscrit toi avec ton mail",image:"assets/images/google_img.png",couleur_fond:Colors.white,couleur_text: Colors.black,onPressed: AuthService.signInWithGoogle),
                    Custombutton(nom:"Inscrit toi avec google",image:"assets/images/google_img.png",couleur_fond:Colors.white,couleur_text: Colors.black,onPressed: AuthService.signInWithGoogle),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width:200,
                          child: Divider(
                          color: Colors.white,
                          thickness: 1,

                        )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text("OU")
                        ),
                        SizedBox(
                            width:200,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,

                            )),
                      ],

                    )
                  ],
                ),
              ),
              Container(
                child: Form(
                  key: form_Key,
                  child: Column(
                    children: [
                      InputWidget(
                        nomchamp: "Entre ton mail",
                        estpassword: false,
                        messageErreur: "Svp le champ mail est obligatoire",
                        controller: mailcontroller,
                      ),
                      const Gap(10),
                      InputWidget(
                        nomchamp: "Entre ton mot de passe",
                        controller: motdepassecontroller,
                        estpassword: true,
                        messageErreur: "Entrez svp votre mot de passe",
                      ),

                      Gap(20),
                      ElevatedButton(
                          onPressed: () async {
                            if(form_Key.currentState!.validate()){
                              bool estconnecter = await AuthService.login_user(
                                  mailcontroller.text.trim(),
                                  motdepassecontroller.text.trim()
                              );
                              if(estconnecter){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChoixScrren()));

                              }
                            }
                            
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),
                        child: Text(
                          "Connexion",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Gap(50),
                      Center(
                          child:GestureDetector(
                            onTap: (){
                              String emailrest = mailcontroller.text;
                              if(emailrest.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("please enter your email")),);
                              }
                              else{
                                try{
                                  AuthService.EmailReset(emailrest);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password reset email sent")),);
                                }
                                catch (e){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to send reset email :$e ")));
                                }
                              }
                            },
                            child: const Text(
                              "mot de passe oublié ? ",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),),
                      SizedBox(height: CustomColor.heigth(context)*0.2),
                      Center(
                        child: SizedBox(
                            height:150,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screeninscription()));
                              },
                              child: RichText(
                                  text:TextSpan(
                                      children: [
                                        TextSpan(
                                          text: " besoin d'un compte ?",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white
                                          ),
                                        ),
                                        TextSpan(
                                          text: "inscris toi",
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
                      ),
                    ],
                  ),
                )
              )

            ],
          ),
        ),
      ),
    );
  }


}
