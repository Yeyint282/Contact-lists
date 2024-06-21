import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Person> _personList = [
    Person('Monkey D.Luffy', 'assets/luffy.jpg', 'luffy@56'),
    Person('Roronoa Zoro', 'assets/zoro.jpg', 'zoro@228'),
    Person('Vinsmoke Sanji', 'assets/sanji.webp', 'sanji@28'),
    Person('Boss Jimbei', 'assets/jimbei.webp', 'jimbei@101'),
    Person('Niko Robin', 'assets/robin.jpg', 'robin@808'),
    Person('Brook', 'assets/brook.jpg', 'brook@408'),
    Person('Franky', 'assets/franky.jpg', 'franky@308'),
    Person('Nami', 'assets/nami.jpg', 'nami@298'),
    Person('Usopp', 'assets/usopp.jpg', 'usopp@500'),
    Person('Tony Tony Chopper', 'assets/chopper.jpg', 'chopper@5'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: const Text(
            'Contact List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          leading: const FlutterLogo(),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.settings),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _personList.length,
          itemBuilder: (BuildContext context, int position) {
            return _listItem(position, context);
          },
        ),
      ),
    );
  }

  Widget _listItem(int position, BuildContext context) {
    Person person = _personList[position];
    return Card(
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(person.photo),
        ),
        title: Text(person.name),
        subtitle: Text(person.userName),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Follow ${person.name}'),
              ),
            );
          },
          child: const Text('Follow'),
        ),
      ),
    );
  }
}

class Person {
  final String name;
  final String photo;
  final String userName;

  Person(this.name, this.photo, this.userName);
}
