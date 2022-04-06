
import 'package:ecomerce_user/db/firestore_helper.dart';
import 'package:ecomerce_user/models/cart_model.dart';
import 'package:ecomerce_user/models/order_constants_model.dart';
import 'package:ecomerce_user/models/order_model.dart';
import 'package:flutter/foundation.dart';

class OrderProvider with ChangeNotifier {
  OrderConstantsModel orderConstantsModel = OrderConstantsModel();

  Future<void> getOrderConstants() async {
    FirestoreHelper.getOrderConstants().listen((snapshot) {
      if(snapshot.exists) {
        orderConstantsModel = OrderConstantsModel.fromMap(snapshot.data()!);
        notifyListeners();
      }
    });
  }

  num getPriceAfterDiscount(num total) {
    return (total - ((total * orderConstantsModel.discount) / 100)).round();
  }

  num getTotalVatAmount(num total) {
    var t = getPriceAfterDiscount(total);
    return ((t * orderConstantsModel.vat) / 100).round();
  }

  num getGrandTotal(num total) {
    return getPriceAfterDiscount(total) + getTotalVatAmount(total) + orderConstantsModel.deliveryCharge;
  }

  Future<void> addNewOrder(OrderModel orderModel, List<CartModel> cartModels) {
    return FirestoreHelper.addNewOrder(orderModel, cartModels);
  }
}