import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:fresp/features/admin/screens/add_product_screen.dart';
import 'package:fresp/features/admin/services/admin_services.dart';
import 'package:fresp/models/category.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<CategoryList>? productCategories = [];
  final AdminServices adminServices = AdminServices();
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void getCategories() async {
    var productCategoriesList = await adminServices.getCategories(context);

    setState(() {
      productCategories = productCategoriesList;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productCategories == null
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: productCategories?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Center(child: Text(productCategories![index].name)));
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FeatherIcons.plus),
        onPressed: navigateToAddProduct,
        tooltip: 'Add a Product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
