import 'package:flutter/material.dart';
import 'package:my_shop_ui/view/HomePage/home_page.dart';
void main(){
  runApp(const MyShopUi());
}
class MyShopUi extends StatelessWidget {
  const MyShopUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
