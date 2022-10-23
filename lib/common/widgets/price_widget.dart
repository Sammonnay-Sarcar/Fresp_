import 'package:flutter/material.dart';
import 'text_widget.dart';
import '../widgets/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return SizedBox(
        child: Row(
      children: [
        TextWidget(
            text: 'Rs.100', color: Colors.red, isTitle: true, textSize: 18),
      ],
    ));
  }
}
