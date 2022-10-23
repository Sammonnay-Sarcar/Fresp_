// // ignore_for_file: constant_identifier_names

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fresp/constants/global_variables.dart';
// import 'package:fresp/features/auth/services/auth_service.dart';

// enum UserOptions { my_orders, delivery_address, logout }

// class UserScreen extends StatelessWidget {
//   const UserScreen({Key? key}) : super(key: key);

//   void logOutUser(BuildContext context) {
//     AuthService authService = AuthService();
//     authService.logOutUser(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('Fresp')),
//         backgroundColor: GlobalVariables.selectedNavBarColor,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // ignore: prefer_const_literals_to_create_immutables
//         children: [
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 0),
//               child: Center(
//                 child: Card(
//                   margin: EdgeInsets.zero,
//                   elevation: 0,
//                   color: GlobalVariables.selectedNavBarColor,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 8.0),
//                     child: SizedBox(
//                         width: double.infinity,
//                         height: 130,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                                 width: double.infinity,
//                                 height: 70,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         width: 50,
//                                         height: 50,
//                                         decoration: const BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg'),
//                                                 fit: BoxFit.fill)),
//                                       ),
//                                       const Flexible(
//                                           fit: FlexFit.tight,
//                                           child: SizedBox(
//                                             child: Padding(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 8.0),
//                                               child: Text(
//                                                 "Sammonnay Sarcar,",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 25,
//                                                     color: Color.fromARGB(
//                                                         211, 0, 0, 0)),
//                                               ),
//                                             ),
//                                           ))
//                                     ],
//                                   ),
//                                 )),
//                             SizedBox(
//                               width: double.infinity,
//                               height: 50,
//                               child: Row(
//                                 children: [
//                                   const Flexible(
//                                     fit: FlexFit.tight,
//                                     child: SizedBox(
//                                       child: ListTile(
//                                           leading: const Icon(
//                                               CupertinoIcons.location_solid),
//                                           tileColor: Colors.white,
//                                           title: Text(
//                                             "this is your address",
//                                             style: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     124, 0, 0, 0)),
//                                           )),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 75,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                                 minimumSize: const Size(
//                                                     double.infinity,
//                                                     double.infinity)),
//                                             onPressed: () {},
//                                             child: const Text(
//                                               "Change",
//                                               style: TextStyle(fontSize: 10),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         )),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                   elevation: 0,
//                   primary: Colors.white,
//                   minimumSize: const Size(double.infinity, 70)),
//               onPressed: () {},
//               child: const Center(
//                 child: Text(
//                   "Previous Orders",
//                   style: TextStyle(color: Color.fromARGB(98, 0, 0, 0)),
//                 ),
//               )),
//           OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                   elevation: 0,
//                   primary: Colors.white,
//                   minimumSize: const Size(double.infinity, 70)),
//               onPressed: () {},
//               child: const Center(
//                 child: Text(
//                   "Saved Addresses",
//                   style: TextStyle(color: Color.fromARGB(98, 0, 0, 0)),
//                 ),
//               )),
//           OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                   elevation: 0,
//                   primary: Colors.white,
//                   minimumSize: const Size(double.infinity, 70)),
//               onPressed: () {},
//               child: const Center(
//                 child: Text(
//                   "Payment Details",
//                   style: TextStyle(color: Color.fromARGB(98, 0, 0, 0)),
//                 ),
//               )),
//           OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                   elevation: 0,
//                   primary: Colors.white,
//                   minimumSize: const Size(double.infinity, 70)),
//               onPressed: () {
//                 logOutUser(context);
//               },
//               child: const Center(
//                 child: Text(
//                   "Sign out",
//                   style: TextStyle(color: Color.fromARGB(98, 0, 0, 0)),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:fresp/features/user/widgets/below_appbar.dart';
import 'package:fresp/features/user/widgets/orders.dart';
import 'package:fresp/features/user/widgets/top_buttons.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Icon(FeatherIcons.user) //TODO: change icon

                  ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
          SizedBox(
            height: 20,
          ),
          Orders()
        ],
      ),
    );
  }
}
