import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restarauntexamapp/Payment/checkout_payment.dart';
import 'package:restarauntexamapp/cartitemalari/cartorders.dart';
import 'package:restarauntexamapp/size_config.dart';
import 'package:restarauntexamapp/widgets/custom_app_bar.dart';
import 'package:restarauntexamapp/widgets/schema_for_variable.dart';

class CartSchema extends StatelessWidget {
  CartSchema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomAppBar(
                          title: "Cart",
                          action: false,
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(56.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("assets/icons/swipe.png"),
                              size: getProportionScreenWidth(25.0),
                            ),
                            SizedBox(width: getProportionScreenWidth(5.0)),
                            Text(
                              "swipe on an item to delete",
                              style: TextStyle(
                                fontSize: getProportionScreenWidth(10.0),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(Variables.authUser.currentUser!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final _datas = snapshot.data['cart_items'];

                    return SliverPadding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionScreenWidth(40.0)),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            Variables.cartList.add(_datas[index]);
                            return CartOrderItem(
                              id: _datas[index],
                            );
                          },
                          childCount: _datas.length,
                        ),
                      ),
                    );
                  }

                  return SliverList(delegate: SliverChildListDelegate([]));
                },
              ),
            ],
          ),
          Positioned(
            bottom: getProportionScreenHeight(40.0),
            child: Container(
              width: getProportionScreenWidth(314.0),
              height: getProportionScreenHeight(70.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  if (Variables.trashList.isNotEmpty) {
                    for (String id in Variables.trashList) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(Variables.authUser.currentUser!.uid)
                          .update({
                        'cart_items': FieldValue.arrayRemove([id]),
                      });
                    }

                    Variables.trashList.clear();
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOutPayment(),
                    ),
                  );
                },
                child: Text(
                  "Complete order",
                  style: TextStyle(
                    fontSize: getProportionScreenWidth(17.0),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
