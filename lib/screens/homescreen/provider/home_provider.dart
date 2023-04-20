import 'package:flutter/cupertino.dart';
import 'package:movieapi/screens/homescreen/model/home_model.dart';
import 'package:movieapi/utils/api_helper.dart';

class HomeProvider extends ChangeNotifier {
  List<D> movie = [];
  String movieName = "HarryPotter";

  // bool anim=false;
  // void animChange()
  // {
  //   anim=!anim;
  //   notifyListeners();
  // }

  Future<void> jsonParsing() async {
    ApiHelper apiHelper = ApiHelper();
    movie = await apiHelper.MovieApi(movieName);
    notifyListeners();
  }

  void ChangeName(String name) {
    movieName = name;
    notifyListeners();
    jsonParsing();
  }

  List image1 = [
    "https://m.media-amazon.com/images/M/MV5BNmQ0ODBhMjUtNDRhOC00MGQzLTk5MTAtZDliODg5NmU5MjZhXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BNGYyZGM5MGMtYTY2Ni00M2Y1LWIzNjQtYWUzM2VlNGVhMDNhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BNTg3NjcxYzgtYjljNC00Y2I2LWE3YmMtOTliZTkwYTE1MmZiXkEyXkFqcGdeQXVyNTY4NDc5MDE@._V1_.jpg",
  ];
  List name1 = [
    "Harry Potter",
    "Avatar",
    "Pirates of the Caribbean",
    "The Lord of the Rings",
  ];
  List image2 = [
    "https://m.media-amazon.com/images/M/MV5BZTMyZmE4MWYtMzA2Yy00MWNhLTkzY2UtZWY0MDg5NTM2YWVmXkEyXkFqcGdeQXVyNzMzMjU5NDY@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMjE1MTM4NDAzOF5BMl5BanBnXkFtZTgwNTMwNjI0MzE@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMTM2Nzg2MDY4MF5BMl5BanBnXkFtZTYwMTQ2MjM2._V1_.jpg"
  ];
  List name2 = ["On the Silver Globe", "Fifty Shades of Grey","Irene Ryan"];
}
