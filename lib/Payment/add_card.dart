import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 80,
          bottom: 50,
        ),
        child: Container(
          // color: Colors.green,
          width: size.width,
          height: size.height - 130,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 40,
                  //   color: Colors.green,
                  alignment: Alignment.center,
                  width: size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        color: Colors.black,
                        iconSize: 28,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline_rounded),
                        color: Colors.black,
                        iconSize: 28,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                child: Container(
                  width: size.width,
                  height: 260,
                  child: PageView.builder(
                    onPageChanged: (e) {
                      setState(() {
                        currentIndex = e;
                      });
                    },
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(110),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                                blurRadius: 2,
                              ),
                            ]),
                      ),
                      width: size.width,
                      height: 260,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 320,
                  child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      height: 40,
                      child: ContanierFigure(
                          soni: 5, currentIndex: currentIndex))),
              Positioned(
                bottom: 1,
                child: Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFA4A0C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 90),
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 360,
                child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tomoto Veggie",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 400,
                child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "GHC 8.00",
                        style: TextStyle(
                          color: Color(0xFFFA4A0C),
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContanierFigure extends StatefulWidget {
  int? soni;
  int? currentIndex;
  ContanierFigure({this.soni, this.currentIndex});
  @override
  _ContanierFigureState createState() => _ContanierFigureState();
}

class _ContanierFigureState extends State<ContanierFigure> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          widget.soni!,
          (index) => Container(
                margin: EdgeInsets.all(4),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == widget.currentIndex!
                      ? Color(0xFFFA4A0C)
                      : Colors.grey.shade200,
                ),
              )),
    );
  }
}
