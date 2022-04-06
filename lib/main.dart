import 'package:ecomerce_user/pages/cart_page.dart';
import 'package:ecomerce_user/pages/customer_info_page.dart';
import 'package:ecomerce_user/pages/launcher_page.dart';
import 'package:ecomerce_user/pages/login_page.dart';
import 'package:ecomerce_user/pages/oder_successful_page.dart';
import 'package:ecomerce_user/pages/order_confirmation_page.dart';
import 'package:ecomerce_user/pages/product_list_page.dart';
import 'package:ecomerce_user/providers/auth_provider.dart';
import 'package:ecomerce_user/providers/cart_provider.dart';
import 'package:ecomerce_user/providers/custom_provider.dart';
import 'package:ecomerce_user/providers/order_provider.dart';
import 'package:ecomerce_user/providers/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (context)=> AuthProvider()),
        ChangeNotifierProvider(create: (context)=> ProductProvider()),
        ChangeNotifierProvider(create: (context)=> CartProvider()),
        ChangeNotifierProvider(create: (context)=> CustomerProvider()),
        ChangeNotifierProvider(create: (context)=> OrderProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LauncherPage(),
          routes: {
            LauncherPage.routeName : (context) => LauncherPage(),
            LoginPage.routeName : (context) => LoginPage(),
            ProductListPage.routeName : (context) => ProductListPage(),
            CartPage.routeName : (context) => CartPage(),
            CustomerInfoPage.routeName : (context) => CustomerInfoPage(),
            OrderConfirmationPage.routeName : (context) => OrderConfirmationPage(),
            OrderSuccessfulPage.routeName : (context) => OrderSuccessfulPage(),

          },
      ),
    );
  }
}


