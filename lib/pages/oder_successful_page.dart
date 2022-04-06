import 'package:flutter/material.dart';

class OrderSuccessfulPage extends StatefulWidget {
  static const String routeName = '/order_successful_page';

  @override
  State<OrderSuccessfulPage> createState() => _OrderSuccessfulState();
}

class _OrderSuccessfulState extends State<OrderSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Placed'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/successful.png', width: 150, height: 150, fit: BoxFit.cover,),
            const Text('Your order has been placed', style: TextStyle(fontSize: 25),),

          ],
        ),
      ),
    );
  }
}
