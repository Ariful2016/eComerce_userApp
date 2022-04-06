import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce_user/models/customer_model.dart';
import 'package:ecomerce_user/models/order_model.dart';

import '../models/cart_model.dart';



class FirestoreHelper {
  static const String _collectionProduct = 'Products';
  static const String _collectionCategory = 'Categories';
  static const String _collectionCustomer = 'Customers';
  static const String _collectionConstants = 'Constants';
  static const String _collectionOrders = 'Orders';
  static const String _collectionOrderDetails = 'OrderDetails';
  static const String _documentOrderConstants = 'OrderConstants';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCategories() => _db.collection(_collectionCategory).orderBy('name').snapshots();
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() => _db.collection(_collectionProduct).where('isAvailable', isEqualTo: true ).snapshots();
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getOrderConstants() => _db.collection(_collectionConstants).doc(_documentOrderConstants).snapshots();


  static Future<QuerySnapshot<Map<String, dynamic>>> findCustomerByPhone(String phone) {
    return _db.collection(_collectionCustomer)
        .where('customerPhone', isEqualTo: phone)
        .get();
  }

  static Future<String> addNewCustomer(CustomerModel customerModel) async {
    final docRef = _db.collection(_collectionCustomer).doc();
    customerModel.customerId = docRef.id;
    await docRef.set(customerModel.toMap());
    return docRef.id;
  }

  static Future<void> updateCustomer(CustomerModel customerModel) {
    final docRef = _db.collection(_collectionCustomer).doc(customerModel.customerId);
    return docRef.update(customerModel.toMap());
  }

  static Future<void> addNewOrder(OrderModel orderModel, List<CartModel> cartList) {
    final writeBatch = _db.batch();
    final orderDoc = _db.collection(_collectionOrders).doc();
    orderModel.orderId = orderDoc.id;
    writeBatch.set(orderDoc, orderModel.toMap());
    cartList.forEach((cartModel) {
      final detailsDoc = _db.collection(_collectionOrders)
          .doc(orderDoc.id)
          .collection(_collectionOrderDetails)
          .doc();
      writeBatch.set(detailsDoc, cartModel.toMap());
    });
    return writeBatch.commit();
  }


}