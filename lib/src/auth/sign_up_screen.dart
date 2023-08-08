import 'package:flutter/material.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class SignUpScreeen extends StatelessWidget {
  const SignUpScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const Expanded(
                  child: Center(
                child: Text(
                  "Cadastro",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              )),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTextField(icon: Icons.email, label: "Email"),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: "Senha",
                        isSecret: true,
                      ),
                      const CustomTextField(icon: Icons.person, label: "Nome"),
                      const CustomTextField(
                          icon: Icons.phone, label: "Telefone"),
                      const CustomTextField(
                          icon: Icons.file_copy, label: "CPF"),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {},
                            child: const Text(
                              "Cadastrar usuário",
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
