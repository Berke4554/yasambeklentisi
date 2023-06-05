import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/sabitler_constants.dart';

class IkonCinsiyet extends StatelessWidget {
  final String? cinsiyet;
  final IconData? icon;
  //NullSafety ?

  IkonCinsiyet(
      {this.cinsiyet = 'default', this.icon = FontAwesomeIcons.addressCard});
  //Constructorımızda(yapıcı fonksiyonumuzda) instancelarımıza default degerler de verdık

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(height: 8),
        Text(
          '$cinsiyet',
          style: yaziStili,
        )
      ],
    );
  }
}
