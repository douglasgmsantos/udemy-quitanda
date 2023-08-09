import 'package:flutter/material.dart';
import 'package:quitanda/src/model/item_model.dart';

class ItemTite extends StatelessWidget {
  const ItemTite({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          //Imagem
          Image.asset(item.imgUrl),

          //nome

          Text(item.itemName)

          //Preco
        ],
      ),
    );
  }
}
