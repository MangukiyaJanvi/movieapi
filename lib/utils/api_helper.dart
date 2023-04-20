import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapi/screens/homescreen/model/home_model.dart';

class ApiHelper {
  Future<List<D>> MovieApi(String name) async {
    String Link =
        "https://imdb8.p.rapidapi.com/auto-complete?q=$name";
    Uri uri = Uri.parse(Link);
    var response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "b3e94325fbmsh8a4d63c1790f718p1bba48jsn648e6d5d744e",
      "X-RapidAPI-Host": "imdb8.p.rapidapi.com"
    });
    var json = jsonDecode(response.body);
    var movie = HomeModel.fromJson(json);
    List<D> homeModelList=movie.d;
    return homeModelList;
  }
}

