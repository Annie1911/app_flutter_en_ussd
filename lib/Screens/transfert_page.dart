import 'package:flutter/material.dart';
import 'package:gestion_menu_ussd/widgets/constcolor.dart';

class TransfertScrren extends StatefulWidget {
  const TransfertScrren({super.key});

  @override
  State<TransfertScrren> createState() => _TransfertScrrenState();
}

class _TransfertScrrenState extends State<TransfertScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.field_text_color,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/images/signup_img.png'),),
            SizedBox(width: 20),
            Text("HELLO USER \nWELCOME BACK ! ",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black
            ),)

          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9),
            child: CircleAvatar(
              backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.notifications,color:Colors.blue,)),
              ),
            ),

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CardSection(),
              OtherSection(),
              ListSection()
            ],
          ),
        ),
      ),
    );
  }
}

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet, color: Colors.white, size: 27),
                          SizedBox(width: 8), // Spacing between icon and text
                          Text(
                            "Your wallet Balance",
                            style: TextStyle(color: Colors.white, fontSize: 13,fontWeight: FontWeight.w300),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                           Icon(Icons.qr_code,color: Colors.white,size: 32,),

                        ],
                      ),


                      Row(

                        children: [
                          Text(
                            "\$24,562.00",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.visibility_off, color: Colors.white),
                        ],
                      ),

                      SizedBox(height: 20),

                    ],

                  ),
            ],
          ),
        ),
      ),
    ) ;
  }
}

class OtherSection extends StatelessWidget {
  const OtherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16)
          ),
          height: MediaQuery.of(context).size.height * 0.18,
          width: double.infinity,
          child: GridView.builder(
            itemCount: 8, // Nombre d'icônes à afficher
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Nombre de colonnes
              crossAxisSpacing: 4, // Espacement horizontal
              mainAxisSpacing: 4, // Espacement vertical
            ),
            itemBuilder: (context, index) {
              return BuildServiceIcon(
                label: "Service $index", // Exemple dynamique
                iconNom: Icons.ice_skating,
                colorFond: Colors.blueGrey,

              );
            },
          ),
        ),
    );
  }
}

class BuildServiceIcon extends StatelessWidget {
  final String label;
  final IconData iconNom;
  final Color colorFond;


  const BuildServiceIcon({
    super.key,
    required this.label,
    required this.iconNom,
    required this.colorFond,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50, // Taille ajustée
          width: 50, // Taille ajustée
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorFond,
          ),
          child: IconButton(
            onPressed: () {
              Nav
            },
            icon: Icon(iconNom, color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14, // Taille de texte adaptée
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}





class ListSection extends StatelessWidget {
  const ListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ;
  }
}





