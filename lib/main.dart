import 'package:flutter/material.dart';
import './detail.dart' as detail;
import './meals.dart' as mealsJson;

void main() {
  runApp(MaterialApp(
    title: "Grid and Meals",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Container> mealsCatalogBreakfast = List();
  List<Container> mealsCatalogDessert = List();

  TabController controller;

  _buatlist() async {
    for (var i = 0; i < mealsJson.data.length; i++) {
      final meals = mealsJson.data[i];
      final String name = meals["name"];
      final String image = meals["image"];
      final String khas = meals["khas"];
      final String rate = meals["rate"];
      final String type = meals["type"];
      final String ingrediens = meals["ingrediens"];
      final String description = meals["description"];

      if (type == "Breakfast") {
        mealsCatalogBreakfast.add(Container(
            padding: EdgeInsets.all(2.0),
            child: Card(
                child: Column(
              children: <Widget>[
                Hero(
                  tag: name,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        //NAVIGATOR PUSH
                        builder: (BuildContext contex) => detail.Detail(
                            name: name,
                            image: image,
                            khas: khas,
                            rate: rate,
                            type: type,
                            ingrediens: ingrediens,
                            description: description),
                      )),
                      child: Image.asset("img/$image", fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(2.0)),
                Text(
                  name,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ))
            ));
      } else {
        mealsCatalogDessert.add(Container(
            padding: EdgeInsets.all(2.0),
            child: Card(
                child: Column(
              children: <Widget>[
                Hero(
                  tag: name,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        //NAVIGATOR PUSH
                        builder: (BuildContext contex) => detail.Detail(
                            name: name,
                            image: image,
                            khas: khas,
                            rate: rate,
                            type: type,
                            ingrediens: ingrediens,
                            description: description),
                      )),
                      child: Image.asset("img/$image", fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(2.0)),
                Text(
                  name,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ))));
      }
    }
  }

  @override
  void initState() {
    _buatlist();
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Meals Catalog", style: TextStyle(color: Colors.white)),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.restaurant),
              text: "Breakfast",
            ),
            Tab(
              icon: Icon(Icons.free_breakfast),
              text: "Dessert",
            )
          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            children: mealsCatalogBreakfast,
          ),
          GridView.count(
            crossAxisCount: 2,
            children: mealsCatalogDessert,
          ),
        ],
      ),

      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.restaurant),
              text: "Breakfast",
            ),
            Tab(
              icon: Icon(Icons.free_breakfast),
              text: "Dessert",
            )
          ],
        ),
      ),

    );
  }
}
