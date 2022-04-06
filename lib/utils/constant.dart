
const String takaSymbal = '৳';
const String imageDirectory = 'ecomerce';
const emptyFieldMsg = 'This field must not be empty';
const negativePriceErrMsg = 'Price shouldn\'t be less than 0';
const negativeStockErrMsg = 'Quantity should be greater than 0';

class PaymentMethod {
  static const String cod = 'Cash on Delivery';
  static const String online = 'Online Payment';
}

class OrderStatus {
  static const String pending = 'Pending';
  static const String delivered = 'Delivered';
  static const String cancelled = 'Cancelled';
}