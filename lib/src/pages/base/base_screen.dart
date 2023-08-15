import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/cart/cart_tab.dart';
import 'package:quitanda/src/pages/home/home_tab.dart';
import 'package:quitanda/src/pages/orders/orders_tab.dart';
import 'package:quitanda/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 700),
              curve: Curves.fastEaseInToSlowEaseOut);
        }),
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
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [HomeTab(), CartTab(), OrdersTab(), ProfileTab()],
      ),
    );
  }
}
