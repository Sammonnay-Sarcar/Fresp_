import "package:flutter/material.dart";
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fresp/common/widgets/text_widget.dart';
import 'package:fresp/features/address/services/Address_services.dart';
import 'package:fresp/features/order/widgets/custom_text_widget.dart';
import 'package:fresp/models/address.dart';
import 'package:fresp/providers/user_detail_provider.dart';
import 'package:provider/provider.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  final AddressServices addressServices = AddressServices();

  List<Address> addresses = [];

  String? address = "fetching";
  @override
  void initState() {
    super.initState();
    getAddresses();
  }

  void getAddresses() async {
    var addressList = await addressServices.getAddress(context);
    setState(() {
      addresses = addressList;
      address = addressList[0].id;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final Color color =Utils(context).color;
    final user = Provider.of<UserDetailProvider>(context).user;
    double sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as double)
        .toList();

    String sum_round = sum.toStringAsFixed(2);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Order Details:',
          style: TextStyle(color: Colors.red[400], fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Total Price: \₹$sum_round',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Container(
          height: 270,
          child: ListView.builder(
            itemCount: user.cart.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black12),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          index: index,
                        ),
                      )));
            },
          ),
        ),
        const Text("Delivering to this address:"),
        SizedBox(
          width: double.infinity,
          child: DropdownButton(
            onChanged: (String? newValue) {
              setState(() {
                address = newValue!;
              });
            },
            value: address,
            icon: const Icon(FeatherIcons.arrowDown),
            items: addresses.map((Address item) {
              return DropdownMenuItem(
                  value: item.id,
                  child: Text('${item.apartment}+ ${item.street}'));
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
