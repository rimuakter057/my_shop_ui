import 'package:flutter/material.dart';
import 'package:my_shop_ui/utils/color.dart';
import 'package:my_shop_ui/utils/image_url.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isChanged = false;
  bool? isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    var medium = Theme.of(context).textTheme.bodyMedium;
    var small = Theme.of(context).textTheme.bodySmall;
    return Scaffold(
      body: Container(
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            AppColors.tealShade,
            AppColors.indigoShade,
            AppColors.brownShadeColor,
            AppColors.whiteColor,
            AppColors.tealShade,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset(
                    ImageUrl.signInIcon,
                    height: height * .2,
                    width: width * .3,
                  ),
                  Text(
                    "SignIn or SignUp",
                    style: medium,
                  ),
                ],
              ),
            ),
            //switch button type
            Container(
              height: height * .06,
              width: width * .6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.black),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChanged = !isChanged;
                      });
                    },
                    child: Container(
                      height: height * .06,
                      width: width * .3,
                      decoration: BoxDecoration(
                        color: isChanged ? Colors.white : Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        "SignIn",
                        style: TextStyle(
                            color: isChanged ? Colors.black : Colors.grey,
                            fontSize: isChanged ? 25 : 16),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChanged = !isChanged;
                      });
                    },
                    child: Container(
                      height: height * .06,
                      width: width * .3,
                      decoration: BoxDecoration(
                        color: isChanged ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: isChanged ? Colors.grey : Colors.black,
                            fontSize: isChanged ? 16 : 25),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //SignIn or SignUp Text
            Container(
              height: height * .05,
              width: width * .4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: isChanged ? AppColors.primaryColor : Colors.indigo,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white
                        .withOpacity(.5), // Shadow color with opacity
                    spreadRadius: 5, // Extent of the shadow
                    blurRadius: 5, // Blurring of the shadow
                    offset: const Offset(
                        5, 5), // Horizontal and vertical shadow offset
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  isChanged ? "SignIn" : "SignUp",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: AppColors.whiteColor,
                    border: Border.all(color: Colors.grey.shade200)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      //From
                      Form(
                         key: _formKey,
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: const Icon(Icons.mail),
                                constraints: BoxConstraints(
                                    maxWidth: width, maxHeight: height * .08),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (String? value){
                                if (value == null || value.isEmpty ){
                                  return "enter email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: const Icon(Icons.visibility_off_outlined),
                                constraints: BoxConstraints(
                                    maxWidth: width, maxHeight: height * .08),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (String? value){
                                if (value == null || value.isEmpty ){
                                  return "enter password";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      )),
                      //forget text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                                print(value);
                              });
                            },
                            checkColor: AppColors.whiteColor,
                          ),
                          Text("remember for me!", style: small),
                          TextButton(
                              onPressed: () {},
                              child: Text("Forget Password?",
                                  style: small?.copyWith(color: AppColors.primaryColor))),
                        ],
                      ),
                      SizedBox(height:height*.04,),
                      //Button
                      SizedBox(
                        height: height * .06,
                        width: width,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() && isChecked ==true){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("success"))
                              );
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Filled required value")));
                              }

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                              shape: const StadiumBorder(
                                side: BorderSide(
                                  color: AppColors.brownShadeColor,
                                ),
                              ),
                            ),
                            child: Text(
                              "Continue",
                              style:
                                  medium?.copyWith(color: AppColors.whiteColor),
                            )),
                      ),
                      // or option
                      Row(children: [
                        Divider(color: Colors.grey,thickness: 1,height: 2,),
                        Text("or"),
                        Divider()
                      ],),
                      //continue with other
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
