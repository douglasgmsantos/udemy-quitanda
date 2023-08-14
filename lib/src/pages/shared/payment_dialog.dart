import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/src/model/order_model.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({super.key, required this.order});

  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Contaúdo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Titulo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Pagamento com Pix",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                //QR CODE
                QrImageView(
                  data: "",
                  version: QrVersions.auto,
                  size: 200,
                ),

                //Vencimento
                Text(
                  "Vencimento ${utilsServices.formatDateTime(order.overdueDateTime)}",
                  style: const TextStyle(fontSize: 12),
                ),

                //Total
                Text(
                  "Total: ${utilsServices.priceToCurrency(order.total)}",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),

                //Copia e cola
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.green,
                        )),
                    onPressed: () {},
                    icon: const Icon(Icons.copy),
                    label: const Text("Copiar código Pix"))
              ],
            ),
          ),

          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ))
        ],
      ),
    );
  }
}
