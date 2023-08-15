import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/model/item_model.dart';
import 'package:quitanda/src/pages/product/product_screen.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class ItemTite extends StatefulWidget {
  const ItemTite(
      {super.key, required this.item, required this.cartAnimationMethod});

  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  @override
  State<ItemTite> createState() => _ItemTiteState();
}

class _ItemTiteState extends State<ItemTite> {
  final UtilsServices utils = UtilsServices();

  final GlobalKey imageGk = GlobalKey();

  IconData tileIcon = Icons.add_shopping_cart_rounded;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => tileIcon = Icons.add_shopping_cart_rounded);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductScreen(
                    item: widget.item,
                  ))),
          child: Card(
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
                  Expanded(
                      child: Container(
                    key: imageGk,
                    child: Hero(
                        tag: widget.item.imgUrl,
                        child: Image.asset(
                          widget.item.imgUrl,
                        )),
                  )),

                  //nome
                  Text(
                    widget.item.itemName,
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
                        utils.priceToCurrency(widget.item.price),
                      ),
                      Text(
                        '/${widget.item.unit}',
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
        ),

        // Adicionar ao carrinho
        Positioned(
            top: 4,
            right: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              child: Material(
                child: InkWell(
                  onTap: () {
                    switchIcon();
                    widget.cartAnimationMethod(imageGk);
                  },
                  child: Ink(
                    height: 40,
                    width: 35,
                    decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                    ),
                    child: Icon(
                      tileIcon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
