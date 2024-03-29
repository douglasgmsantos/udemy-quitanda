import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/shared/custom_text_field.dart';
import 'package:quitanda/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do usuário"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
              readOnly: true,
              initialValue: app_data.user.email,
              icon: Icons.email,
              label: "Email"),
          CustomTextField(
              readOnly: true,
              initialValue: app_data.user.name,
              icon: Icons.person,
              label: "Nome"),
          CustomTextField(
              readOnly: true,
              initialValue: app_data.user.phone,
              icon: Icons.phone,
              label: "Celular"),
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.cpf,
            icon: Icons.copy,
            label: "CPF",
            isSecret: true,
          ),
          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () => updatePassword(),
                  child: const Text(
                    "Atualizar senha",
                  )))
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Atualização de senha",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: "Senha Atual",
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: "Nova Senha",
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: "Confirmar nova senha",
                        isSecret: true,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Atualizar"),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close)))
              ],
            )));
  }
}
