import 'package:ecomerce_user/models/product_model.dart';
import 'package:ecomerce_user/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class ProductItem extends StatefulWidget {
  final ProductModel productModel;
  ProductItem(this.productModel);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 7,

      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FadeInImage.assetNetwork(
              fadeInDuration: const Duration(seconds: 2),
              fadeInCurve: Curves.bounceInOut,
              width: double.maxFinite,
              height: 150,
              fit: BoxFit.cover,
              placeholder: 'images/image_placeholder.png',
              image: widget.productModel.imageDownloadUrl!,
            ),
          ),
           ListTile(
             title: Text(widget.productModel.name!, style: TextStyle(fontSize: 16, color: Colors.black),),
             subtitle: Text(widget.productModel.category!),
             trailing: Text(widget.productModel.stock!.toString()),
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('$takaSymbal${widget.productModel.price}',style: TextStyle(fontSize: 20, color: Colors.black),),
              Consumer<CartProvider>(
                builder: (context, provider, _) =>ElevatedButton(
                    onPressed: (){
                      if(provider.isInCart(widget.productModel.id!)){
                        provider.removeFromCart(widget.productModel.id!);
                      }else{
                        provider.addToCart(widget.productModel);
                      }

                    },
                    child: Text(provider.isInCart(widget.productModel.id!) ? 'Remove' : 'Add' )),
              )
            ],
          )

        ],
      )
    );
  }
}
