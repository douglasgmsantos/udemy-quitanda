// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quitanda/src/model/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  List<CartItemModel> items;

  String copyAndPaste;
  DateTime overdueDateTime;
  String status;
  double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.items,
    required this.copyAndPaste,
    required this.overdueDateTime,
    required this.status,
    required this.total,
  });
}
