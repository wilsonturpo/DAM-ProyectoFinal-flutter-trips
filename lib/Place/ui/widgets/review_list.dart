import 'dart:convert';

import 'package:flutter/material.dart';
import 'review.dart';
import 'package:http/http.dart' as http;

class ReviewList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ReviewList();
  }
}
class _ReviewList extends State<ReviewList> {

  Future<List<Review>> _listOfReviews;

  Future<List<Review>> _getReviews() async {
    final response = await http.get('http://192.168.1.4:3000/reviews');

    List<Review> reviews = [];

    if(response.statusCode == 200 ){
      //  print(response.body);
      String body = utf8.decode(response.bodyBytes);
      final jsonArrayData = jsonDecode(body);
      //print(jsonArrayData);

      for (var item in jsonArrayData){
        reviews.add(
          Review(item["pathImage"], 
                item["name"], 
                item["details"], 
                item["comment"])
          );
      }

      return reviews;
    }else{
      throw Exception("Falló");
    }
  }

    @override
    void initState(){
      super.initState();
      _listOfReviews = _getReviews();
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return FutureBuilder(
              future: _listOfReviews,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  print(snapshot.data);
                  
                  return Column(
                      children: _listReviews(snapshot.data),//<Widget>[
                      //ProfilePlace(place),
                      //ProfilePlace(place2),
                    //],
                    //children: _listPlaces(snapshot.data),
                  );
                } else if(snapshot.hasError){
                  return Text("Error");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          );
      /*
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Review("assets/img/wilson.jpg", "Wilson Turpo", "4 review 8 photos", "There is an amazing place in Perú"),
          Review("assets/img/elsa.jpg", "Elsa Maritza", "1 review 5 photos", "There is an amazing place in Perú"),
          Review("assets/img/kathy.png", "Katherine", "1 review 5 photos", "Perú is a beautiful country"),
          Review("assets/img/maria.png", "María Aguilar", "1 review 5 photos", "Perú is a beautiful country"),
          Review("assets/img/dani.png", "Daniel Toledo", "2 review 5 photos", "I love this app, it is fantastic!"),
          Review("assets/img/pet.png", "Peter", "2 review 5 photos", "I love this app, it is fantastic!"),
          Review("assets/img/jilmer.png", "Jilmer Branco", "2 review 5 photos", "I love this app, it is fantastic!")

        ],
      );*/
    }

    List<Widget> _listReviews(List<Review>data){
      List<Review> reviews = [];

      for (var review in data){
        reviews.add(
          Review(review.pathImage, 
                review.name, 
                review.details, 
                review.comment));
      }

      return reviews;
    }
}