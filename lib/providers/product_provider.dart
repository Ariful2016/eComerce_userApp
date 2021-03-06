
import 'package:ecomerce_user/db/firestore_helper.dart';
import 'package:ecomerce_user/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier{

  List<String> categoryList = [];
  List<ProductModel> productList = [];

  void getAllCategories(){
    FirestoreHelper.getCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['name']);
      notifyListeners();
    });
  }
  void getAllProducts(){
    FirestoreHelper.getAllProducts().listen((snapshot) {
      productList = List.generate(snapshot.docs.length, (index) => ProductModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }


}