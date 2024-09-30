import 'dart:convert';


import '../model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiController {
  Future<List<ApiModel>?> getApiModel() async {
    try {
      var response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
/*List <ApiModel> model =
List <ApiModel>.from(json.decode(response.body).map ((x)=> ApiModel.formJson(x)));*/
    List<ApiModel>  model =
    List <ApiModel>.from(json.decode(response.body).map((x)=> ApiModel.fromJson(x)));
    return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
