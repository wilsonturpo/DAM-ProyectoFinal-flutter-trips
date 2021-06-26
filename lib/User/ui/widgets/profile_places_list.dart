import 'dart:convert';

import 'package:flutter/material.dart';
import 'profile_place.dart';
import '../../../Place/model/place.dart';
import 'package:http/http.dart' as http;

class ProfilePlacesList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProfilePlacesList();
  }

}
/*
  Place place = new Place('Arequipa', 'Uno de los mejores lugares turísticos', 'Paisajes y valles hermosos', '123,123,123');
  Place place2 = new Place('Huacachina:Oasis en el desierto', 'El oasis más hermoso de todos los desiertos', 'Surf en arena y mucho más!', '321,321,321');
*/

class _ProfilePlacesList extends State<ProfilePlacesList> {

 Place place = Place(
      name: "Knuckles Mountains Range",
      description: "Hiking. Water fall hunting. Natural bath",
      urlImage: "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 3

  );
  Place place2 = Place(
      name: "Mountains",
      description: "Hiking. Water fall hunting. Natural bath', 'Scenery & Photography",
      urlImage: "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 10

  );

  Future<List<Place>> _listOfPlaces;

  Future<List<Place>> _getPlaces() async {
    final response = await http.get('http://54.83.168.240:3000/place');

    List<Place> places = [];

    if(response.statusCode == 200 ){
      //  print(response.body);
      String body = utf8.decode(response.bodyBytes);
      final jsonArrayData = jsonDecode(body);
      //print(jsonArrayData);

      for (var item in jsonArrayData){
        places.add(
          Place(name:item["name"], 
                description:item["description"], 
                urlImage:item["urlImage"], 
                likes:item["likes"])
          );
      }

      return places;
    }else{
      throw Exception("Falló");
    }
  }

  @override
  void initState(){
    super.initState();
    _listOfPlaces = _getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      
      child: FutureBuilder(
            future: _listOfPlaces,
            builder: (context, snapshot){
              if(snapshot.hasData){
                print(snapshot.data);
                
                return Column(
                    children: _listPlaces(snapshot.data),//<Widget>[
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
          )
    );
  }

  List<Widget> _listPlaces(List<Place>data){
    List<ProfilePlace> places = [];

    for (var place in data){
      places.add(
        ProfilePlace(
        Place(name:place.name, 
                  description:place.description, 
                  urlImage:place.urlImage, 
                  likes:place.likes))
            );
    }

    return places;
  }
}