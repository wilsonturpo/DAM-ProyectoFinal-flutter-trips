import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/wilson.jpg", "Wilson Turpo", "1 review 5 photos", "There is an amazing place in Perú"),
        Review("assets/img/elsa.jpg", "Elsa Maritza", "1 review 5 photos", "There is an amazing place in Perú"),
        Review("assets/img/kathy.png", "Katherine", "1 review 5 photos", "Perú is a beautiful country"),
        Review("assets/img/maria.png", "María Aguilar", "1 review 5 photos", "Perú is a beautiful country")
      ],
    );
  }
}