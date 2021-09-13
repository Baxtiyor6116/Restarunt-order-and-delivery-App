import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restarauntexamapp/size_config.dart';
import 'package:restarauntexamapp/widgets/schema_for_variable.dart';

class CustomAppBar extends StatefulWidget {
  final title;
  final action;
  final user;
  final id;
  const CustomAppBar({
    Key? key,
    this.title,
    this.action,
    this.user,
    this.id,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    if (widget.action) {
      bool _find = false;
      for (var item in widget.user['favorite_items']) {
        if (item == widget.id) {
          _find = true;
        }
      }
      _isFavorite = _find;
    }

    return Padding(
      padding: EdgeInsets.only(
        top: getProportionScreenHeight(60.0),
        left: getProportionScreenWidth(40.0),
        right: getProportionScreenWidth(40.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
              size: getProportionScreenWidth(22.0),
            ),
          ),
          if (widget.title != null)
            Text(
              widget.title,
              style: TextStyle(
                fontSize: getProportionScreenWidth(18.0),
              ),
            ),
          widget.action
              ? InkWell(
                  onTap: () {
                    if (_isFavorite) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(Variables.authUser.currentUser!.uid)
                          .update({
                        'favorite_items': FieldValue.arrayRemove([widget.id]),
                      });

                      _isFavorite = !_isFavorite;
                    } else {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(Variables.authUser.currentUser!.uid)
                          .update({
                        'favorite_items': FieldValue.arrayUnion([widget.id]),
                      });

                      _isFavorite = !_isFavorite;
                    }

                    setState(() {});
                  },
                  child: ImageIcon(
                    AssetImage('assets/images/favourite.png'),
                    color: _isFavorite ? Colors.orange : Colors.black,
                    size: getProportionScreenWidth(22.0),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
