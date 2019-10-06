import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Detail({this.name, this.image, this.khas, this.rate, this.type, this.ingrediens, this.description});
  final String name;
  final String image;
  final String khas;
  final String rate;
  final String type;
  final String ingrediens;
  final String description;
  
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body:  ListView(
        children: <Widget>[
           Container(
              height: 240.0,
              child:  Hero(
                tag: name,
                child:  Material(
                  child:  InkWell(
                    child:  Image.asset(
                      "img/$image",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
           DetailSpaceTop(name: name, khas: khas, rate: rate, type: type),
           DetailSpaceIcon(),
           Description(description: description),

           Ingrediens(ingrediens: ingrediens),
        ],
      ),
    );
  }
}

class DetailSpaceTop extends StatelessWidget {
  DetailSpaceTop({this.name, this.khas, this.rate, this.type});
  final String name;
  final String khas;
  final String rate;
  final String type;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.all(10.0),
      child:  Row(
        children: <Widget>[
           Expanded(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                 Text(
                  "Special From "+khas,
                  style:  TextStyle(fontSize: 20.0, color: Colors.blue),
                ),

                 Text(
                  type,
                  style:  TextStyle(fontSize: 17.0, color: Colors.grey),
                ),

              ],
            ),
          ),
           Row(
            children: <Widget>[
               Icon(Icons.star, size: 20.0, color: Colors.red),
               Text(
                rate,
                style:  TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DetailSpaceIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(
      padding:  EdgeInsets.all(10.0),
      child:  Row(
        children: <Widget>[
           Icontext(
            icon: Icons.call,
            text: "Call",
          ),
           Icontext(
            icon: Icons.message,
            text: "Message",
          ),
           Icontext(
            icon: Icons.photo,
            text: "Photo",
          )
        ],
      ),
    );
  }
}

class Icontext extends StatelessWidget {
  Icontext({this.icon, this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child:  Column(
        children: <Widget>[
           Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
           Text(
            text,
            style:  TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  Description({this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.all(10.0),
      child:  Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Text(
            description,
            style:  TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}


class Ingrediens extends StatelessWidget {
  Ingrediens({this.ingrediens});
  final String ingrediens;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.all(10.0),
      child:  Row(
        children: <Widget>[
          Expanded(
            child:  Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Text(
                    "Ingrediens : ",
                    style:  TextStyle(fontSize: 18.0, color: Colors.blue),
                    textAlign: TextAlign.justify,
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Text(
                      ingrediens,
                      style:  TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}