import 'package:flutter/material.dart';
import 'package:quitanda/src/model/cart_item_model.dart';
import 'package:quitanda/src/model/order_model.dart';
import 'package:quitanda/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class OrderTile extends StatelessWidget {
  OrderTile({super.key, required this.order});

  final OrderModel order;
  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == "pending_payment",
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Pedido ${order.id}"),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  utilsServices.formatDateTime(order.createdDateTime),
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              )
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //Itens do pedido
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items
                            .map((orderItem) => _OrderItemWidget(
                                  utilsServices: utilsServices,
                                  orderItem: orderItem,
                                ))
                            .toList(),
                      ),
                    ),
                  ),

                  //divisão
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                  ),

                  //Status d pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget(
      {required this.utilsServices, required this.orderItem});

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
