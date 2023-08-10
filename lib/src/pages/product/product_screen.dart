import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/model/item_model.dart';
import 'package:quitanda/src/pages/shared/quantity_widget_custom.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.item});

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          //conteúdo
          Column(
            children: [
              // Image
              Expanded(
                  child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.asset(widget.item.imgUrl))),

              //Dados do produto
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 2))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //nome - quantidade
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.itemName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                        QuantityWidgetCustom(
                          value: cartItemQuantity,
                          suffixText: widget.item.unit,
                          result: (quantity) {
                            setState(() {
                              cartItemQuantity = quantity;
                            });
                          },
                        )
                      ],
                    ),

                    //preco
                    Text(
                      utilsServices.priceToCurrency(widget.item.price),
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor),
                    ),

                    //descrição
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.item.description,
                            style: const TextStyle(height: 1.5),
                          ),
                        ),
                      ),
                    ),

                    //botão
                    SizedBox(
                      height: 55,
                      child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          label: const Text(
                            "Adicionar ao carrinho",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                    )
                  ],
                ),
              ))
            ],
          ),

          //botão de voltar
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios))),
          )
        ],
      ),
    );
  }
}
