import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sosyal_duvar_demo/models/post_models.dart';

class PostApi {
  final String url =
      "https://63347899ea0de5318a039283.mockapi.io/intesa/mobil/post";
  Future<List<PostModel>> readPostJsonData() async {
    final jsonData = await http.get(Uri.parse(url));

    if (jsonData.statusCode == 200) {
      List<dynamic> body = jsonDecode(jsonData.body);
      List<PostModel> posts = body
          .map(
            (e) => PostModel.fromMap(e),
          )
          .toList();
      return posts;
    } else {
      throw "${jsonData.statusCode}  Unable to retrieve posts ";
    }
  }
}
