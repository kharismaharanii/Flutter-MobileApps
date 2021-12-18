import 'package:flutter/material.dart';
import 'package:mybengkel/homepage/model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            slideList[index].title,
            style: TextStyle(
                fontSize: 35,
                color: Colors.lightBlue[900],
                fontFamily: 'PTSans',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            slideList[index].desc,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'PTSans',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 500.0,
          width: 350.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
            ),
          ),
        ),
      ],
    );
  }
}
