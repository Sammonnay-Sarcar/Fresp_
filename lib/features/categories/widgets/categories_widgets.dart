import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget{
  const CategoriesWidget({Key? key}):super(key : key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.red.withOpacity(0.7),width: 2

        )
      )
    );
  }
}
