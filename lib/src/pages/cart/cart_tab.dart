import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as app_data;
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/model/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/components/cart_tile.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    // app_data.cardItems.remove(cartItem);
    setState(() {
      app_data.cardItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in app_data.cardItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: app_data.cardItems.length,
                  itemBuilder: (_, index) {
                    return CartTitle(
                        cartItem: app_data.cardItems[index],
                        onRemove: removeItemFromCart);
                  })),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total geral",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.customSwatchColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customSwatchColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () async {
                        bool? result = await showOrderConfirmation();
                        print(result);
                      },
                      child: const Text(
                        "Concluir pedido",
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Confirmação'),
        content: const Text("Deseja realmente concluir o pedido?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Não")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Sim")),
        ],
      ),
    );
  }
}
