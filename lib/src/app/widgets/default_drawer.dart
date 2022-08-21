import 'package:explore_your_city/src/app/constants/constants.dart';
import 'package:explore_your_city/src/domain/entities/user.dart' as ent;
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  ent.User user;
  NavigationDrawer(this.user);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Drawer(
      
      backgroundColor: cBlue,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context, user, size, padding),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(
          BuildContext context, ent.User user, Size size, EdgeInsets padding) =>
      Container(
        color: cBlue,
        padding: EdgeInsets.only(
          top: padding.top,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: size.width * 0.3,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cWhite,
                ),
                child: Center(child: Text(user.imageUrl)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              user.firstName,
              style: kLargeTitleStyle(cWhite),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: EdgeInsets.only(right: 10, top: 20),
      child: Column(
        children: [
          Text("data"),
        ],
      ));
}
