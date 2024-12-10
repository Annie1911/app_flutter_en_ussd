import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatefulWidget {
  final String nomchamp;
  final TextEditingController controller;
  final bool estpassword;
  final String messageErreur;

  const InputWidget({
    super.key,
    required this.nomchamp,
    required this.controller,
    this.estpassword = false,
    required this.messageErreur,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.estpassword; // Initialiser avec l'état du mot de passe
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        TextFormField(
          style: const TextStyle(
            color: Color(0xffd45226),
          ),
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.messageErreur;
            }
            if (!RegExp(r"^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
                .hasMatch(value)) {
              return "Veuillez entrer un email valide";
            }
            return null;
          },
          obscureText: isObscure,
          decoration: InputDecoration(
            fillColor: Colors.black,
            hintText: widget.nomchamp,
            hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.0, color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
            suffixIcon: widget.estpassword
                ? IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: isObscure
                  ? const Icon(Icons.visibility_off, color: Colors.blueGrey)
                  : const Icon(Icons.visibility, color: Colors.blueGrey),
            )
                : null,
          ),
        ),
      ],
    );
  }
}
