import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fresp/common/widgets/text_widget.dart';
import 'package:fresp/common/widgets/utils.dart';
import 'package:fresp/constants/global_variables.dart';

class ProductDetails extends StatefulWidget {
  static const String routename = '/product-details';

  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getscreenSize;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: Icon(FeatherIcons.arrowLeft),
          ),
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
                  child: Icon(FeatherIcons.user) //TODO: change icon

                  ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: 'Product ID:', color: color, textSize: 15),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                'Product Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: size.height * 0.40,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                        'https://media.istockphoto.com/photos/farm-market-in-the-fall-apples-picture-id1088157488',
                        height: 300,
                        width: 500,
                        fit: BoxFit.fill);
                  },
                  autoplay: false,
                  itemCount: 4,
                  // ignore: prefer_const_constructors
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      // ignore: prefer_const_constructors
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white,
                          activeColor: Color.fromARGB(255, 233, 58, 5))),
                )),
            Container(
              color: Color.fromARGB(255, 110, 109, 109),
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                    text: ' Price: ',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(31, 10, 10, 10),
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: ' Rs.100 ',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product Description',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 110, 109, 109),
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Material(
                    color: const Color.fromARGB(255, 226, 138, 6),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 90, vertical: 10),
                          child: TextWidget(
                            text: 'Buy Now',
                            textSize: 25,
                            color: Colors.black,
                          ),
                        ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Material(
                  color: const Color.fromARGB(255, 54, 177, 5),
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 10),
                        child: TextWidget(
                          text: 'Add to Cart',
                          textSize: 20,
                          color: Colors.white,
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
