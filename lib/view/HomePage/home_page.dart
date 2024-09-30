import 'package:flutter/material.dart';


import '../../controller/api_controller.dart';
import '../../model/api_model.dart';
import '../Widget/common_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isReady = false;
  List<ApiModel> apiModel = [];

  getPost() {
    bool isReady = true;
    ApiController().getApiModel().then((value) {
      setState(() {
        apiModel = value!;
        bool isReady = false;
      });
    });
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isReady == true
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const CommonText(
                      text: 'MyShop',
                      fontSize: 25,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: apiModel.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return Container(
                              height: MediaQuery.sizeOf(context).height * .35,
                              width: MediaQuery.sizeOf(context).width * 3,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    offset: Offset(2, 2),
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        apiModel[index].image.toString(),
                                        height:
                                            MediaQuery.sizeOf(context).height * .14,
                                        width:
                                            MediaQuery.sizeOf(context).width * 3,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                            text: apiModel[index]
                                                .title
                                                .toString()),
                                        CommonText(
                                          text:
                                              "\$${apiModel[index].price.toString()}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.teal,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.teal,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.teal,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CommonText(
                                              text:
                                                  "${(apiModel[index].rating!.rate.toString())}",
                                              fontSize: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            CommonText(
                                              text: apiModel[index]
                                                  .rating!
                                                  .count
                                                  .toString(),
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
