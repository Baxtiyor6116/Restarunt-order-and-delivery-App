import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restarauntexamapp/Orders/order_screen.dart';
import 'package:restarauntexamapp/searchitems/search_orders.dart';
import 'package:restarauntexamapp/size_config.dart';
import 'package:restarauntexamapp/widgets/custom_app_bar.dart';
import 'package:restarauntexamapp/widgets/orders.dart';

class SeeMorePage extends StatelessWidget {
  String? data1;

  SeeMorePage({this.data1, Key? key}) : super(key: key);

  List _searchItems = [];
  List _dataItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "See more",
            action: false,
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('orders')
                  .doc(data1)
                  .collection(data1!)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  _dataItems = snapshot.data.docs;
                  print(_dataItems);
                  return Padding(
                    padding:
                        EdgeInsets.only(top: getProportionScreenHeight(50)),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionScreenWidth(35.0),
                      ),
                      itemCount: _searchItems.length != 0
                          ? _searchItems.length
                          : _dataItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: getProportionScreenWidth(35.0),
                        mainAxisSpacing: getProportionScreenWidth(17.0),
                        mainAxisExtent: getProportionScreenHeight(300.0),
                      ),
                      itemBuilder: (context, index) {
                        final _item = _searchItems.length != 0
                            ? _searchItems[index]
                            : _dataItems[index];

                        print(_item.data()['name']);
                        final Order _order = Order(
                          id: _item.id,
                          name: _item.data()['name'],
                          price: _item.data()['price'],
                          image: _item.data()['image'],
                        );
                        return GestureDetector(
                          child: SearchOrderItem(
                            order: _order,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                  index: index,
                                  data: _dataItems,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
