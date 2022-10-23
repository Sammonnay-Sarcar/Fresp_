import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fresp/common/widgets/text_widget.dart';
import 'package:fresp/common/widgets/utils.dart';
import 'package:fresp/features/address/screen/address_screen.dart';
import 'package:fresp/features/cart/screen/empty_screen.dart';
import 'package:fresp/features/cart/widgets/cart_widget.dart';

import '../../../constants/global_variables.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToAddress() {
    Navigator.pushNamed(context, AddressScreen.routeName,
        arguments: AddressScreen);
  }

  void navigateToEmptyScreen() {
    Navigator.pushNamed(context, EmptyCartScreen.routeName,
        arguments: EmptyCartScreen);
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png',
                    width: 120, height: 45, color: Colors.black),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Icon(FeatherIcons.user)),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          _checkout(ctx: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkout({
    required BuildContext ctx,
  }) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              FittedBox(
                child: TextWidget(
                  text: 'Total Rs.500',
                  color: Colors.black,
                  textSize: 20,
                  isTitle: true,
                ),
              ),
              const Spacer(),
              Material(
                  color: Color.fromARGB(255, 7, 100, 11),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: navigateToAddress,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                          text: 'Order Now',
                          textSize: 20,
                          color: Colors.white,
                        ),
                      ))),
            ],
          ),
        ));
  }
}
