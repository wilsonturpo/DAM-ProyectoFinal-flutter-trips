import 'package:flutter/material.dart';
import '../widgets/description_place.dart';
import 'header_appbar.dart';
import '../widgets/review_list.dart';

class HomeTrips extends StatelessWidget {
  String descriptionDummy = "Perú no solamente te ofrece uno de los territorios más megadiversos del mundo, sino que, gracias a esta distinción, queda certificado que dicho destino cumple con todos los estándares internacionales de higiene y bioseguridad.";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Perú", 4, descriptionDummy),
            ReviewList()

          ],
        ),
        HeaderAppBar()
      ],
    );
  }

}