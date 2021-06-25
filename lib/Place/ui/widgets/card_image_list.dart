//import 'dart:convert';
import 'package:flutter/material.dart';
import 'card_image.dart';
//import 'package:http/http.dart' as http;

class CardImageList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CardImageList();
  }
}

class _CardImageList extends State<CardImageList> {

  //Future<List<CardImage>> _listOfCards;
  /*
  Future<List<CardImage>> _getCards() async {
    final response = await http.get('http://192.168.1.4:3000/cards');

    List<CardImage> cards = [];

    if(response.statusCode == 200 ){
      //  print(response.body);
      String body = utf8.decode(response.bodyBytes);
      final jsonArrayData = jsonDecode(body);
      //print(jsonArrayData);

      for (var item in jsonArrayData){
        cards.add(
          CardImage(item["pathImage"])
          );
      }

      return cards;
    }else{
      throw Exception("Falló");
    }
  }
  */
   @override
    void initState(){
      super.initState();
      //_listOfCards = _getCards();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      /*
      child:  FutureBuilder(
                future: _listOfCards,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    print(snapshot.data);
                    
                    return ListView(
                      padding: EdgeInsets.all(25.0),
                      scrollDirection: Axis.horizontal,
                      children: _listCards(snapshot.data),//<Widget>[
                        //ProfilePlace(place),
                        //ProfilePlace(place2),
                      //],
                      //children: _listPlaces(snapshot.data),
                    );
                  } else if(snapshot.hasError){
                    print(snapshot.error);
                    return Text("Error");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
      */
      
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/img/Arequipa.jpg"),
          CardImage("assets/img/huacachina.jpg"),
          CardImage("assets/img/machu-picchu.jpg"),
          CardImage("assets/img/misti.jpg"),
          CardImage("assets/img/nasca.jpg"),
          CardImage("assets/img/paracas.jpg")
        ],
      ),
    );
  }
  /*
  List<Widget> _listCards(List<CardImage>data){
    List<CardImage> cards = [];

    for (var card in data){
      cards.add(
        CardImage(card.pathImage));
    }

    return cards;
  }
  */
}