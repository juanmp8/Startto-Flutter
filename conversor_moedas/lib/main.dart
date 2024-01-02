import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = 'https://api.hgbrasil.com/finance?key=bda1a32c';

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  late double dolar;
  late double euro;

  void initializeCurrencies(Map data) {
    dolar = data['results']['currencies']['USD']['buy'];
    euro = data['results']['currencies']['EUR']['buy'];
  }

  void _realChanged(String text) {
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void _clearAll(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

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
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    "Carregando Dados...",
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao carregar dados...",
                      style: TextStyle(color: Colors.amber, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  initializeCurrencies(snapshot.data!);
                  return SingleChildScrollView(
                    child: Column(
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
                        buildTextField("Reais", "R\$", realController, _realChanged),
                        buildTextField("Dólares", "US\$", dolarController, _dolarChanged),
                        buildTextField("Euros", "€", euroController, _euroChanged),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController cont, Function(String) func) {
  return Container(
    margin: EdgeInsets.all(10),
    child: TextField(
      controller: cont,
      style: TextStyle(color: Colors.amber, fontSize: 22),
      decoration: InputDecoration(
        prefixText: prefix,
        prefixStyle: TextStyle(color: Colors.amber, fontSize: 22),
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber, fontSize: 22),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onChanged: func,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    ),
  );
}
