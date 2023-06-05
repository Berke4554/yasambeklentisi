import 'package:flutter/material.dart';

//MyContainer adındaki kendi oluşturduğumuz özel widgetımızı ayrı bir dosyaya aldık

class MyContainer extends StatelessWidget {
  final Color? renk;
  final Widget? child;
  final Function()? onPress;
  //fonksiyon klasında bir degisken tanımladık ve bunu widgetimizda bir property olarak
  //olusturduk böylece MyContainer widgetimiza gesture detectorun propertısı olan
  //on tap e ulasmak ıcın onPress degıskenımızı kullanacagız

  MyContainer({this.renk = Colors.white, this.child, this.onPress});
  //default olarak deger atadık eger bız hıc bır sey vermezsek

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: renk,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
