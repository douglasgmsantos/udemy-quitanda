import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/model/item_model.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class ItemTite extends StatelessWidget {
  ItemTite({super.key, required this.item});

  UtilsServices utils = UtilsServices();
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Imagem
                Expanded(child: Image.asset(item.imgUrl)),

                //nome
                Text(
                  item.itemName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),

                //Preco
                Row(
                  children: [
                    Text(
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor),
                      utils.priceToCurrency(item.price),
                    ),
                    Text(
                      '/${item.unit}',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
