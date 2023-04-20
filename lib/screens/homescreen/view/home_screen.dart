import 'package:flutter/material.dart';
import 'package:movieapi/screens/homescreen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Movies & Shows"),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'search');
                },
                icon: Icon(Icons.search),
              ),
            ),
          ],
          // actions: [
          //   Container(
          //     width: 360,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 10,
          //         ),
          //         AnimatedContainer(
          //           duration: Duration(seconds: 5),
          //           width: (homeProviderFalse!.anim == true) ? 250 : 180,
          //           curve: Curves.ease,
          //           height: 50,
          //           alignment: Alignment.center,
          //           child: (homeProviderTrue!.anim == false)
          //               ? Text(
          //                   'Movies & Shows',
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20),
          //                 )
          //               : Row(
          //                 children: [
          //                   TextFormField(
          //                       controller: txtmoviename,
          //                       decoration: InputDecoration(
          //                         border: UnderlineInputBorder(
          //                           borderSide: BorderSide(color: Colors.black),
          //                         ),
          //                       ),
          //                     ),
          //                 ],
          //               ),
          //         ),
          //         Expanded(
          //           child: SizedBox(),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: IconButton(
          //             onPressed: () {
          //               homeProviderTrue!.animChange();
          //               String name = txtmoviename.text;
          //               homeProviderFalse!.ChangeName(name);
          //             },
          //             icon: Icon(
          //               Icons.search,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
        ),
        body: Column(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              child: Image.network(
                  "https://m.media-amazon.com/images/M/MV5BZTMyZmE4MWYtMzA2Yy00MWNhLTkzY2UtZWY0MDg5NTM2YWVmXkEyXkFqcGdeQXVyNzMzMjU5NDY@._V1_.jpg",
                  fit: BoxFit.fill),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      homeProviderTrue!
                          .ChangeName(homeProviderTrue!.name1[index]);
                      Navigator.pushNamed(context, 'data', arguments: index);
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 160,
                            width: 110,
                            child: Image.network(
                                '${homeProviderTrue!.image1[index]}',
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: Text("${homeProviderTrue!.name1[index]}")),
                      ],
                    ),
                  ),
                ),
                itemCount: homeProviderFalse!.image1.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      homeProviderTrue!
                          .ChangeName(homeProviderTrue!.name2[index]);
                      Navigator.pushNamed(context, 'data', arguments: index);
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 160,
                            width: 110,
                            child: Image.network(
                                '${homeProviderTrue!.image2[index]}',
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: Text("${homeProviderTrue!.name2[index]}")),
                      ],
                    ),
                  ),
                ),
                itemCount: homeProviderFalse!.image2.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
