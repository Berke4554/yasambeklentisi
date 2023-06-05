class UserData {
  String? seciliCinsiyet;
  double? icilenSigara;
  double? yapilanSpor;
  int? boy;
  int? kilo;

  UserData({
    this.seciliCinsiyet,
    this.icilenSigara,
    this.yapilanSpor,
    this.boy,
    this.kilo,
  });

  //burada ilk sayfada kullanıcıdan aldıgımız verılerı dıger sayfaya aktarmak ıcın ılk once bır class olusturduk
  //sımdı bu class'ı , bılgılerı gonderecegımız sayfaya kabul ettırmemız lazım bu ıslemı o sayfada constructor tanımlayarak baslıcaz
}
