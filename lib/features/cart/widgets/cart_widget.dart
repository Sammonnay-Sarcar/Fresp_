import 'package:flutter/cupertino.dart';
//import 'package:fresp/features/auth/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresp/common/widgets/text_widget.dart';
import 'package:fresp/features/product/screen/product_details.dart';

//import 'package:fresp/router.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int cartcount = 0;
  void incrementCount() {
    setState(() {
      cartcount++;
      _quantityTextController.text = cartcount.toString();
    });
  }

  void decrementCount() {
    setState(() {
      cartcount--;
      _quantityTextController.text = cartcount.toString();
    });
  }

  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = cartcount.toString();
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
  }

  Widget build(BuildContext context) {
    //final Color color =Utils(context).color;

    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routename);
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://media.istockphoto.com/photos/farm-market-in-the-fall-apples-picture-id1088157488',
                            width: 200,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: '  Text',
                              color: Colors.black,
                              textSize: 20,
                              isTitle: true,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: 150,
                              child: Row(
                                children: [
                                  _quantityController(
                                      fct: () => {decrementCount()},
                                      icon: CupertinoIcons.minus,
                                      color: Colors.red),
                                  Flexible(
                                    flex: 1,
                                    child: TextField(
                                      controller: _quantityTextController,
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide())),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                      onChanged: (v) {
                                        setState(() {
                                          if (v.isEmpty) {
                                            _quantityTextController.text =
                                                cartcount.toString();
                                          } else {
                                            return;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  _quantityController(
                                    fct: () => {incrementCount()},
                                    icon: CupertinoIcons.plus,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.cart_badge_minus,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text: 'Rs.100',
                              color: Colors.black,
                              textSize: 17,
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _quantityController({
    required Function fct,
    required IconData icon,
    required Color color,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(icon, size: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
