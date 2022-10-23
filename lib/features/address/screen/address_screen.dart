import 'package:flutter/material.dart';
import 'package:fresp/common/widgets/custom_text_field.dart';

import '../../../common/widgets/text_widget.dart';
import '../../../common/widgets/utils.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController towncityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    contactController.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    towncityController.dispose();
  }

  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),
            title: TextWidget(
              text: 'User information',
              color: color,
              isTitle: true,
              textSize: 22,
            ),
          ),
        ),
        body: Form(
            key: _addressFormKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: fullNameController,
                  hintText: 'Full name',
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: contactController,
                  hintText: 'Contact Number',
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  controller: flatBuildingController,
                  hintText: 'Flat,House Number,Building',
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: areaController,
                  hintText: 'Area,Street',
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: pincodeController,
                  hintText: 'Pincode',
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: towncityController,
                  hintText: 'Town/City',
                ),
                SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Material(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextWidget(
                                      text: 'Proceed to Pay',
                                      textSize: 20,
                                      color: Colors.white,
                                    ),
                                  ))),
                        ],
                      ),
                    ))
              ],
            )));
  }
}
