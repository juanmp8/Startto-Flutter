import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "\$ Conversor \$",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.monetization_on,
              size: 140,
              color: Colors.amber,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.amber, fontSize: 22),
              decoration: InputDecoration(
                prefixText: 'R\$',
                prefixStyle: TextStyle(color: Colors.amber, fontSize: 22),
                labelText: 'Reais',
                labelStyle: TextStyle(color: Colors.amber, fontSize: 22),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.amber, fontSize: 22),
              decoration: InputDecoration(
                prefixText: 'R\$',
                prefixStyle: TextStyle(color: Colors.amber, fontSize: 22),
                labelText: 'Dólares',
                labelStyle: TextStyle(color: Colors.amber, fontSize: 22),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.amber, fontSize: 22),
              decoration: InputDecoration(
                prefixText: 'R\$',
                prefixStyle: TextStyle(color: Colors.amber, fontSize: 22),
                labelText: 'Euros',
                labelStyle: TextStyle(color: Colors.amber, fontSize: 22),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
