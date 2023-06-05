import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/sabitler_constants.dart';
import 'package:yasam_beklentisi/sonuclar.dart';
import 'package:yasam_beklentisi/user_data.dart';

import 'ikon_cinsiyet.dart';
import 'konteyner.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double yapilanSpor = 0.0;
  int boy = 160;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildRowOutlndBtnMetodu(boyKilo: 'BOY'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlndBtnMetodu(boyKilo: 'KİLO'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Günde Kaç Kez Spor Yapıyorsunuz?',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            yapilanSpor.round().toString(),
                            style: kalinYaziStili,
                          ),
                          Slider(
                              min: 0,
                              max: 7,
                              divisions: 7,
                              value: yapilanSpor,
                              onChanged: (double yeniDeger) {
                                //onChangeda atadıgımız anonım fonksıyonun ıcındekı yerel degısken
                                //yerel oldugu ıcın sadece fonksıyonun ıcerısınde tanınır bu yuzden
                                //asagıdakı konteynırın yeniDegerı ıle karısmaz hata alınmaz

                                setState(() {
                                  yapilanSpor = yeniDeger;
                                });
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Günde Kaç Sigara İçiyorsunuz?',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${icilenSigara.round()}',
                            //2 farklı sekılde string ıfadeye degısken ataması yaptık
                            //usttekı wıdgetınkıyle bırlıkte
                            style: kalinYaziStili,
                          ),
                          Slider(
                              min: 0.0,
                              max: 40.0,
                              value: icilenSigara,
                              onChanged: (double yeniDeger) {
                                //sliderın bulundugu konumu yenideger adlı fonksıyon parametremız
                                // sayesınde tutup bu degerı icilenSigara adlı degıskenımıze atıyoruz

                                setState(() {
                                  //degerimizin atandığı ve setState sayesinde çizildiği yer
                                  icilenSigara = yeniDeger;
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'kadın';
                        });
                      },
                      renk: seciliCinsiyet == 'kadın'
                          ? Colors.pink
                          : Colors.white,
                      child: IkonCinsiyet(
                        cinsiyet: 'Kadın',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'erkek';
                        });
                      },
                      renk: seciliCinsiyet == 'erkek'
                          ? Colors.limeAccent
                          : Colors.white,
                      child: IkonCinsiyet(
                        cinsiyet: 'Erkek',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SonucSayfasi(
                          UserData(
                            //burada SonucSayfasina constructorına verdıgımız UserData nesnesini istedi ve bizde burada verdik
                            boy: boy,
                            kilo: kilo,
                            seciliCinsiyet: seciliCinsiyet,
                            icilenSigara: icilenSigara,
                            yapilanSpor: yapilanSpor,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'SONUÇLAR',
                    style: yaziStili,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowOutlndBtnMetodu({String? boyKilo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text('$boyKilo', style: yaziStili),
        ),
        SizedBox(width: 10),
        RotatedBox(
          quarterTurns: 3,
          child:
              Text(boyKilo == 'BOY' ? '$boy' : '$kilo', style: kalinYaziStili),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  boyKilo == 'BOY' ? boy++ : kilo++;
                });
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(20, 30),
                side: BorderSide(color: Colors.lightBlueAccent),
              ),
              child: Icon(FontAwesomeIcons.plus),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  boyKilo == 'BOY' ? boy-- : kilo--;
                  //eger boyKilo adlı degıskene 'BOY' degerı gelırse boy degıskenınden eksılt
                  //eger gelmezse kilo degıskenınden eksilt yaptık
                  //ternary operator ile birlikte
                });
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(20, 30),
                side: BorderSide(color: Colors.lightBlueAccent),
              ),
              child: Icon(FontAwesomeIcons.minus),
            ),
          ],
        )
      ],
    );
  }
}
