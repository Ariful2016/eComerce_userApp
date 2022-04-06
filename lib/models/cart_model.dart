class CartModel{
  String productId;
  String productName;
  num price;
  int qty;

  CartModel({
    required this.productId,
    required this.productName,
    required this.price,
    this.qty = 1});

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      'productId' : productId,
      'productName' : productName,
      'price' : price,
      'qty' : qty,
    };
    return map;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
      productId : map['productId'],
      productName : map['productName'],
      price : map['price'],
      qty : map['qty'],
  );

  @override
  String toString() {
    return 'CartModel{productId: $productId, productName: $productName, price: $price, qty: $qty}';
  }
}