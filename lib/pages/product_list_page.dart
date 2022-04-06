
import 'package:ecomerce_user/auth/firebase_auth_service.dart';
import 'package:ecomerce_user/custom_widget/main_drawer.dart';
import 'package:ecomerce_user/custom_widget/product_item.dart';
import 'package:ecomerce_user/pages/cart_page.dart';
import 'package:ecomerce_user/providers/cart_provider.dart';
import 'package:ecomerce_user/providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  static const String routeName = '/products';

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ProductProvider _productProvider;
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if(_isInit){
      _productProvider = Provider.of<ProductProvider>(context);
      _productProvider.getAllProducts();
      if(!FirebaseAuthService.isUserEmailVerified) {
        Future.delayed(Duration.zero, () {
          _showEmailVerificationAlertDialog();
        });
      }
    }
    _isInit = false;


    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('All Products'),
        actions: [
          Consumer<CartProvider>(
            builder:(context, provider, _) => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () => Navigator.pushNamed(context, CartPage.routeName),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.orangeAccent,
                    shape: BoxShape.circle
                  ),
                  child: FittedBox(child: Text('${provider.totalItemsInCart}'),),
                )
              ],
            ),
          )
        ],
      ),
      body:
      _productProvider.productList.isEmpty? const Center(
        child: Text('No item found'),
      ): GridView.count(
        padding: const EdgeInsets.all(4.0),
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.7,
        children: _productProvider.productList.map((product) => ProductItem(product)).toList(),

      )
    );
  }
  Widget fadedImageWidget(String url){
    return FadeInImage.assetNetwork(
        fadeInDuration: const Duration(seconds: 3),
        fadeInCurve: Curves.bounceInOut,
        fit: BoxFit.cover,
        placeholder: 'images/image_placeholder.png',
        image: url);
  }
  void _showEmailVerificationAlertDialog() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Email not verified'),
      content: const Text('Click the button below to send a verification mail to your email address.'),
      actions: [
        ElevatedButton(
          child: const Text('Send Verification mail'),
          onPressed: () {
            FirebaseAuthService.sendVerificationMail()
                .then((value) {
              Navigator.pop(context);
            });
          },
        )
      ],
    ));
  }
}
