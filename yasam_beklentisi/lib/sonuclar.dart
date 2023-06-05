import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/user_data.dart';

import 'hesap.dart';
import 'sabitler_constants.dart';

class SonucSayfasi extends StatelessWidget {
  //Sonuc sayfamız userdata tipinde bir veriyi constructor sayesınde kabul edeblıyor
  final UserData _userData;

  SonucSayfasi(this._userData);
  //constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        title: Text(
          'SONUÇ SAYFASI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  //asagıda Hesap adında klasımızdan _userData verilerini
                  //constructorına yollayarak bır nesne yaratmıs olduk
                  //sadece anonim bir nesne olmuş oldu
                  //normalde bır degıskene atıyorduk ya o yani
                  Hesap(_userData).hesaplama().round().toString(),
                  style: yaziStili,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Geri Dön', style: yaziStili),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
