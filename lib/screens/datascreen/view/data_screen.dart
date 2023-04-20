import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../homescreen/provider/home_provider.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).jsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${homeProviderTrue!.movieName}"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Row(
            children: [
              Container(
                height: 200,
                width: 150,
                margin: EdgeInsets.all(8),
                child: Image.network(
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
                      "${homeProviderTrue!.movie[index].l}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${homeProviderTrue!.movie[index].s}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Year : ${homeProviderTrue!.movie[index].y}',
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
    );
  }
}
