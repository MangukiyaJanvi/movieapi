import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../homescreen/provider/home_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false)
        .ChangeName('Harry Potter');
  }
  TextEditingController txtmoviename = TextEditingController();
  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: txtmoviename,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                      String name=txtmoviename.text;
                      print(name);
                      homeProviderTrue!.ChangeName(name);
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      margin: EdgeInsets.all(8),
                      child:
                          (homeProviderTrue!.movie[index].i!.imageUrl == null)
                              ? FlutterLogo()
                              : Image.network(
                                  "${homeProviderTrue!.movie[index].i!.imageUrl}",
                                  fit: BoxFit.fill,
                                ),
                    ),
                    Container(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (homeProviderTrue!.movie[index].l == null)
                                ? ""
                                : "${homeProviderTrue!.movie[index].l}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            (homeProviderTrue!.movie[index].s == null)
                                ? ""
                                : '${homeProviderTrue!.movie[index].s}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            (homeProviderTrue!.movie[index].y == null)
                                ? ""
                                : 'Year : ${homeProviderTrue!.movie[index].y}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                itemCount: homeProviderTrue!.movie.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
