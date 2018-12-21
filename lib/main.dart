import 'package:flutter/material.dart';
import 'rants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'devRant',
      theme: ThemeData(
        fontFamily: 'Product Sans',
      ),
      home: Rant(),
    );
  }
}

class Rant extends StatefulWidget {
  @override
  State createState() => new RantList();
}

class RantList extends State<Rant> {
  DevRant devRant;
  List<Rants> rantList;

  @override
  void initState() {
    super.initState();
  }

  var algo = 'recent';
  Future<void> fetchRants() async {
    var url = 'https://devrant.com/api/devrant/rants?app=3&sort=' +
        algo +
        '&limit=50';
    var result = await http.get(url);
    var decodedResult = jsonDecode(result.body);
    devRant = DevRant.fromJson(decodedResult);
    rantList = devRant.rants;
  }

  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Image.network(
                  'https://avatars.devrant.com/v-21_c-1_b-5_g-m_9-1_1-2_16-8_3-1_8-4_7-4_5-1_12-2_6-2_10-7_2-37_22-7_11-3_18-1_19-3_4-1_20-2.png'),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('developed by d02d33pak',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.arrow_upward),
              title: Text(
                'Increase Font Size',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                if (_fontSize < 20) {
                  _fontSize += 2;
                  setState(() {});
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_downward),
              title: Text('Decrease Font Size',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
              onTap: () {
                if (_fontSize > 16) {
                  _fontSize -= 2;
                  setState(() {});
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Toggle Dark Theme'),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Coming Soon!'),
                ));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Mnml devRant',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              tooltip: algo,
              icon: Icon(
                Icons.filter_list,
              ),
              onPressed: () {
                algo = (algo == 'recent') ? 'best' : 'recent';
                setState(() {});
              }),
          IconButton(
              icon: Icon(
                Icons.refresh,
              ),
              onPressed: () {
                setState(() {});
              }),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        onRefresh: fetchRants,
        child: FutureBuilder(
            future: fetchRants(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press Button to Start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return Text('Error');
                  return rantLister(_fontSize);
              }
              return null;
            }),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   child: new Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       IconButton(
      //           icon: Icon(Icons.format_size),
      //           onPressed: () {
      //             if (_fontSize > 16) {
      //               _fontSize -= 2;
      //               setState(() {});
      //             }
      //           }),
      //       IconButton(
      //         icon: Icon(Icons.format_size),
      //         onPressed: () {
      //           if (_fontSize < 20) {
      //             _fontSize += 2;
      //             setState(() {});
      //           }
      //         },
      //       )
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 8.0,
      //   onPressed: () {
      //     fetchRants();
      //     setState(() {});
      //   },
      //   child: Icon(Icons.refresh),
      //   // elevation: 2.0,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  ListView rantLister(_fontSize) {
    return ListView.builder(
      itemCount: (rantList.length),
      itemBuilder: (context, index) => Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                            child: Container(
                                height: 256.0,
                                child: Center(
                                    child: Text(
                                        rantList[index].userId.toString()))));
                      }),
                  leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://avatars.devrant.com/' +
                                      rantList[index]
                                          .userAvatar
                                          .i
                                          .toString())))),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(rantList[index].userUsername,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 0.0),
                          child: Text(
                            DateFormat('hh:mmaaa  dd-LLL-yy').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    rantList[index].createdTime * 1000)),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  ),
                  subtitle: Text('++' + rantList[index].userScore.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                    child: Text(
                      rantList[index].text,
                      style: TextStyle(
                        fontSize: _fontSize,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: PinchZoomImage(
                    image: (rantList[index].image)
                        ? FadeInImage.memoryNetwork(
                            fadeInDuration: Duration(milliseconds: 700),
                            placeholder: kTransparentImage,
                            image: (rantList[index].image
                                ? rantList[index].attachedImage.url
                                : ''),
                          )
                        : SizedBox(),
                  ),
                ),
                Transform(
                    transform: Matrix4.identity()..scale(0.8),
                    alignment: Alignment(0.8, 0),
                    child: ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton.icon(
                            icon: Icon(Icons.favorite_border),
                            label: Text(rantList[index].score.toString()),
                            onPressed: () {},
                          ),
                          FlatButton.icon(
                            icon: Icon(Icons.chat_bubble_outline),
                            label: Text(rantList[index].numComments.toString()),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )),
                Center(
                    child: Container(
                  height: 3.0,
                  width: 128.0,
                  color: Colors.black12,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                ))
              ],
            ),
          ),
    );
  }
}
