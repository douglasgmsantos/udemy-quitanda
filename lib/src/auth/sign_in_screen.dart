import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //nome do App
                const Text.rich(TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                          text: "Green",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "grocer", style: TextStyle(color: Colors.red))
                    ])),

                SizedBox(
                  height: 25,
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 25),
                    child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText("Frutas"),
                          FadeAnimatedText("Verduras"),
                          FadeAnimatedText("Legumes"),
                          FadeAnimatedText("Cereais"),
                          FadeAnimatedText("Laticíneos")
                        ]),
                  ),
                )
              ],
            ),
          ),

          // Formulário
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTextField(
                  label: "E-mail",
                  icon: Icons.email,
                ),
                const CustomTextField(
                  label: "Senha",
                  icon: Icons.lock,
                  isSecret: true,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () {},
                      child: const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Esqueceu a senha?",
                        style: TextStyle(color: Colors.red),
                      )),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withAlpha(90),
                        thickness: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("ou"),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withAlpha(90),
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            side: const BorderSide(
                                width: 2, color: Colors.green)),
                        onPressed: () {},
                        child: const Text(
                          "Criar Conta",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
