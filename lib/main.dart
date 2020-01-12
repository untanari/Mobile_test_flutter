import 'package:flutter/material.dart';
import 'package:mobile_test/page_details.dart';
import 'package:mobile_test/repository/repository.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'model/house.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

const String sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit," +
    " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." +
    " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. " +
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur." +
    " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      appBar: appbar,
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget get appbar => AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget bottomLayer(House datax) {
    Widget row(IconData icon, String value) => Row(
          children: <Widget>[Icon(icon), SizedBox(width: 6), Text(value)],
        );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        children: [
          TableRow(
            children: [
              row(Icons.developer_board, datax.details.baths),
              row(Icons.device_unknown, datax.details.beds),
              row(Icons.directions, datax.details.landArea),
            ],
          ),
          TableRow(
            children: [
              row(Icons.directions_car, datax.details.landAreaSqft),
              row(Icons.directions_subway, datax.details.tenure),
              row(Icons.do_not_disturb, datax.details.tenureType),
            ],
          ),
        ],
      ),
    );
  }

  Widget topLayer(String image, House data) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "image",
              child: FlutterLogo(
                size: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data.name),
                Text(data.price),
              ],
            ),
          ],
        ),
      );

  Widget get body => FutureBuilder<Houses>(
        future: Repository.getHouse,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // display error
            var error = snapshot.error;
            return Text(error);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // display loading
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            // display result
            var result = snapshot.data;
            print(result);
            return ListView.builder(
              itemCount: result.data.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageDetail("")),
                  );
                },
                child: Column(
                  children: [
                    topLayer(
                        "https://specials-images.forbesimg.com/imageserve/1026205392/960x0.jpg",
                        result.data[index]),
                    bottomLayer(result.data[index])
                  ],
                ),
              ),
            );
          }
          return Text("default");
        },
      );
}
