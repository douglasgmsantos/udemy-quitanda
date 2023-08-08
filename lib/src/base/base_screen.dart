import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.customSwatchColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              label: "Carrinho",
              icon: Icon(
                Icons.shopping_cart_outlined,
              )),
          BottomNavigationBarItem(
              label: "Pedidos",
              icon: Icon(
                Icons.list,
              )),
          BottomNavigationBarItem(
              label: "Perfil",
              icon: Icon(
                Icons.person_outline,
              ))
        ],
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
