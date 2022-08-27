import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DefaultDetailContainer extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String numberOfComments;
  final String numberOfVisitors;
  final Function() pageName;

  const DefaultDetailContainer(
      {super.key,
      required this.imageUrl,
      required this.placeName,
      required this.numberOfComments,
      required this.numberOfVisitors,
      required this.pageName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return InkWell(
      child: Stack(children: [
        Container(
          width: size.width - 36,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                opacity: 0.25,
                fit: BoxFit.fill,
                image: NetworkImage(
                  imageUrl,
                )),
          ),
        ),
        Positioned(
          left: padding.left + 20,
          bottom: padding.bottom + 20,
          child: Text(placeName, style: kLargeTitleStyle(cBlue)),
        ),
        Positioned(
          right: padding.right + 20,
          bottom: padding.bottom + 10,
          child: Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.accessibility_new_rounded,
                    size: size.height * 0.045,
                    color: cBlue,
                  ),
                  Text(
                    numberOfVisitors,
                    style: TextStyle(color: cBlue),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: size.height * 0.045,
                    color: cBlue,
                  ),
                  Text(
                    numberOfComments,
                    style: TextStyle(color: cBlue),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: padding.right + 10,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: size.height * 0.05,
                color: cBlue,
              ),
            )),
      ]),
      onTap: pageName,
    );
  }
}
