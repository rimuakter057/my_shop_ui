import 'package:flutter/material.dart';
import 'package:my_shop_ui/utils/color.dart';
import 'package:my_shop_ui/view/SignInPage/sign_in_page.dart';
void main(){
  runApp(const MyShopUi());
}
class MyShopUi extends StatelessWidget {
  const MyShopUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: MediaQuery.sizeOf(context).height*.04
          ),
          bodySmall: TextStyle(
              color: AppColors.blackColor,
              fontSize: MediaQuery.sizeOf(context).height*.02,
          ),
        ),
      ),
      home: SignInPage(),
    );
  }
}
