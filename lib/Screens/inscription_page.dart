import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gestion_menu_ussd/models/user_model.dart';
import 'package:gestion_menu_ussd/widgets/constcolor.dart';
import 'package:gestion_menu_ussd/widgets/constinput.dart';
import 'package:gap/gap.dart';
import 'package:gestion_menu_ussd/services/auth_service.dart';

import 'accueil_page.dart';
import 'connection_page.dart';

class Screeninscription extends StatefulWidget {
  const Screeninscription({super.key});

  @override
  State<Screeninscription> createState() => _ScreeninscriptionState();
}

class _ScreeninscriptionState extends State<Screeninscription> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: CustomColor.background_color,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: CustomColor.width(context),
                height: CustomColor.heigth(context)*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "S'Inscrire",
                      style: TextStyle(
                        color: CustomColor.icon_color,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox( height: 25),
                    Custombutton(nom:"Inscrit toi avec ton mail",image:"assets/images/google_img.png",couleur_fond:Colors.white,couleur_text: Colors.black,onPressed: AuthService.signInWithGoogle),
                    Custombutton(nom:"Inscrit toi avec google",image:"assets/images/google_img.png",couleur_fond:Colors.white,couleur_text: Colors.black,onPressed: AuthService.signInWithGoogle),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 12),child: Text('ou',style: TextStyle(fontSize: 12,color: Colors.green,fontWeight: FontWeight.w200),),),
                  SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  )
                ],
              ),
              const Gap(10),
              Container(
                width: CustomColor.width(context),
                height: CustomColor.heigth(context) * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
        
                          InputWidget(
                            nomchamp: "Entre ton nom",
                            estpassword: false,
                            messageErreur: "Svp le champ nom est obligatoire",
                            controller: nameController,
                          ),
                          const Gap(10),
                          InputWidget(
                          nomchamp: "Entre ton mail",
                          estpassword: false,
                          messageErreur: "Svp le champ mail est obligatoire",
                          controller: emailController,
                          ),
                          const Gap(10),
                          InputWidget(
                            nomchamp: "Entre ton mot de passe",
                            controller: passwordController,
                            estpassword: true,
                            messageErreur: "Entrez svp votre mot de passe",
                          ),
                          const Gap(10),
                          InputWidget(
                            nomchamp: "Confirme ton mot de passe",
                            controller: confirmPasswordController,
                            estpassword: true,
                            messageErreur: "Remplissez le champ svp ",
                          ),
                          const Gap(20),
                          ElevatedButton(
                            onPressed: () async {
                              if(formKey.currentState!.validate()){
                                bool estcreer = await AuthService.register_user(
                                    User_ges(
                                      nom: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      motpasse: passwordController.text.trim(),
                                    )
                                );
                                if(estcreer){
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context)=>Scrren_Connection()));
                                }
                                else{
                                  print("Erreur suite à un probleme");
                                }

                              }

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text('Inscription',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                color: Colors.white
                              ),),

                          ),
                        ],
                      ),
                    ),
                  ),
        
              ),
              const Gap(20),
        
              Container(
                height: CustomColor.heigth(context) * 0.2,
                child: Wrap(
                  spacing: 35,
                  runSpacing: 8,
                  children: [
                    Center(
                      child: const  Text("By signing up, I agree to the Privacy Policy and Terms of Service",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // ou une autre couleur adaptée
                          fontSize: 14, // Ajuste la taille selon tes préférences
                        ),
                      ),
                    ),
                    SizedBox(height: CustomColor.heigth(context)*0.02),
                    Center(
                      child: RichText(text: TextSpan(
                          text: "As tu un compte?",
                          style: const TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 20
                          ),
                          children: [
                            TextSpan(
                                text: "Connect toi",
                                style: TextStyle(
                                    color:CustomColor.text_color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20
                                ),
                                recognizer : TapGestureRecognizer()
                                  ..onTap=(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Scrren_Connection()));
                                  }),
        
                          ]
                      )),
                    )
        
                  ],
                ),
              )
        
        
            ],
          ),
        ),
      ),
    );
  }
}