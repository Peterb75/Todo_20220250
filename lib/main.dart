import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            theme: ThemeData(
        brightness: Brightness.dark,
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Seleccionar> _todoList = []; 

  _showDialog() async {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:const Text('Ingrese una Actividad'),
          content: TextField(
            controller: _textFieldController,
          ),
          actions: <Widget>[
            TextButton(
              child:const Text('Aceptar'),
              onPressed: () {
                setState(() {
                  _todoList.add(Seleccionar(text: _textFieldController.text, checked: false));
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 184, 122, 30),
        title: const Text('TO Do List'),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            child: CheckboxListTile(
            title: Text(
              _todoList[index].text,
              style: _todoList[index].checked
                  ?  const TextStyle(decoration: TextDecoration.lineThrough) : const TextStyle(),
            ),
            value: _todoList[index].checked,
            onChanged: (bool? value) {
              setState(() {
                _todoList[index].checked = value!;
              });
            },
          )
      );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add, color: Colors.orange),
      ),
    );
  }
}

class Seleccionar {
  String text;
  bool checked;

  Seleccionar({required this.text, required this.checked});
}
 