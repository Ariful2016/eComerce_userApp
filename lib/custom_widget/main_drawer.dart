import 'package:ecomerce_user/auth/firebase_auth_service.dart';
import 'package:ecomerce_user/pages/login_page.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.teal,
            height: 200,
          ),
          ListTile(
            onTap: (){},
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
          ),
          ListTile(
            onTap: (){},
            leading: const Icon(Icons.reorder),
            title: const Text('My Orders'),
          ),
          ListTile(
            onTap: (){
              FirebaseAuthService
                  .logoutUser()
                  .then((_) => Navigator
                  .pushReplacementNamed(context, LoginPage.routeName));
            },

            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
