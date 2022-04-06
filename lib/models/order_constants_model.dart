class OrderConstantsModel {
  int deliveryCharge;
  int discount;
  int vat;

  OrderConstantsModel({this.deliveryCharge = 0, this.discount = 0, this.vat = 0});

  factory OrderConstantsModel.fromMap(Map<String,dynamic> map) => OrderConstantsModel(
    deliveryCharge: map['deliveryCharge'],
    discount: map['discount'],
    vat: map['vat'],
  );

  @override
  String toString() {
    return 'OrderConstantsModel{deliveryCharge: $deliveryCharge, discount: $discount, vat: $vat}';
  }
}