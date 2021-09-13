import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restarauntexamapp/Orders/order_complete.dart';
import 'package:restarauntexamapp/Orders/order_screen.dart';
import 'package:restarauntexamapp/Orders/orders_shopping_not_yet.dart';
import 'package:restarauntexamapp/Payment/checkout_payment.dart';
import 'package:restarauntexamapp/cartitemalari/cartschema.dart';
import 'package:restarauntexamapp/clientProfilePage/ClientProfile.dart';
import 'package:restarauntexamapp/favourite/favouritePage.dart';
import 'package:restarauntexamapp/homepage/see_more.dart';
import 'package:restarauntexamapp/other_pages/history.dart';
import 'package:restarauntexamapp/searchitems/search_in_screen.dart';
import 'package:restarauntexamapp/size_config.dart';

class HomePage extends StatefulWidget {
  ZoomDrawerController? zoomDrawerController;
  HomePage([this.zoomDrawerController]);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List mytabs = ["Foods", "Drinks", "Snacks", "Saucegas"];

  TabController? _tabController;
  int _bottomvalue = 0;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: mytabs.length, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0x909090),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 28, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: getProportionScreenHeight(30),
                    width: 40,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/icons/Vector.png",
                        fit: BoxFit.fitWidth,
                      ),
                      onPressed: () {
                        print(widget.zoomDrawerController);
                        widget.zoomDrawerController!.open!();
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartSchema()));
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black.withOpacity(
                        0.4,
                      ),
                      size: 25,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getProportionScreenHeight(10),
              ),
              Container(
                margin: EdgeInsets.only(left: getProportionScreenWidth(10)),
                height: getProportionScreenHeight(100),
                width: getProportionScreenWidth(200),
                child: Text(
                  "Delicious food for you",
                  style: TextStyle(
                      fontSize: getProportionScreenWidth(32),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: getProportionScreenHeight(60),
                  width: getProportionScreenWidth(314),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_outlined,
                        color: Colors.black.withOpacity(0.5),
                        size: getProportionScreenWidth(25),
                      ),
                      SizedBox(
                        width: getProportionScreenWidth(20),
                      ),
                      Text("Search ..."),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFEFEEEE)),
                ),
              ),
              Container(
                height: getProportionScreenHeight(50),
                width: getProportionScreenWidth(450),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.orange.shade600,
                  indicatorColor: Colors.orange.shade600,
                  unselectedLabelColor: Colors.grey.shade500,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        mytabs[0],
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        mytabs[1],
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        mytabs[2],
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        mytabs[3],
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    tabBarView('foods'),
                    tabBarView('drinks'),
                    tabBarView('snacks'),
                    tabBarView('sauces'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: onTabTapped,
          currentIndex: _bottomvalue,
          elevation: 20,
          selectedItemColor: Colors.red.shade500,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: ""),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _bottomvalue = index;

      if (_bottomvalue == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FavouriteScreen()));
      }

      if (_bottomvalue == 2) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ClientProfilePage()));
      }
      if (_bottomvalue == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => History()));
      }
    });
  }

  Widget tabBarView(docs) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .doc(docs)
          .collection(docs)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final docList = snapshot.data.docs;
          // print(snapshot.data.docs[0]['image']);
          return Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("see more"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SeeMorePage(data1: docs,)));
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics:
                      BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount: docList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                      index: index,
                                      data: docList,
                                    )));
                      },
                      child: Container(
                        width: getProportionScreenHeight(270),
                        height: getProportionScreenWidth(300),
                        margin: EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 70,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: getProportionScreenHeight(270),
                                width: getProportionScreenWidth(220),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      docList[index]['name'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "N${docList[index]['price']}.00",
                                      style: GoogleFonts.actor(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: -23,
                              child: Container(
                                alignment: Alignment.center,
                                height: getProportionScreenHeight(190),
                                width: getProportionScreenWidth(280),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(docList[index]['image']),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
