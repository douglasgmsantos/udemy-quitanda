import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/model/cart_item_model.dart';
import 'package:quitanda/src/pages/shared/quantity_widget_custom.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class CartTitle extends StatefulWidget {
  const CartTitle({super.key, required this.cartItem, required this.onRemove});

  final CartItemModel cartItem;
  final Function(CartItemModel cartItem) onRemove;

  @override
  State<CartTitle> createState() => _CartTitleState();
}

class _CartTitleState extends State<CartTitle> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        //imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        //titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),

        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),

        //quantidade
        trailing: QuantityWidgetCustom(
          value: widget.cartItem.quantity,
          suffixText: widget.cartItem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (quantity == 0) {
                widget.onRemove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
