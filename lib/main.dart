import 'package:flutter/material.dart';
import 'package:quotes_app/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class Task {
  String? qText;
  String? sText;
  Task({required this.qText, required this.sText});
}

class _QuotesState extends State<Quotes> {
  List allTask = [
    // Task(qText: 'nawaf', sText: 'bin helabi'),
    // Task(qText: 'nawaf', sText: 'bin helabi'),
  ];
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();

  myfunc() {
    setState(() {
      allTask.add(Task(qText: mycontroller1.text, sText: mycontroller2.text));
    });
  }

  delete(int remove) {
    setState(() {
      allTask.remove(allTask[remove]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          'BEST QUUOTES',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 600,
              child: ListView.builder(
                  itemCount: allTask.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Cards(
                        qText: allTask[index].qText,
                        sText: allTask[index].sText,
                        delete: delete,
                        remove: index);
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              // isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: mycontroller1,
                        maxLength: 20,
                        decoration: InputDecoration(labelText: 'Add new Quote'),
                      ),
                      SizedBox(height: 100),
                      TextField(
                        controller: mycontroller2,
                        maxLength: 20,
                        decoration: InputDecoration(labelText: 'Add author'),
                      ),
                      TextButton(
                          onPressed: () {
                            myfunc();

                            Navigator.pop(context);
                          },
                          child: Text('ADD'))
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
