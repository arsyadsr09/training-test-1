import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        key: Key("1"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List user = [];
  List<Map<String, dynamic>> data = [
    {"id": "C", "type": 0},
    {"id": "+/-", "type": 0},
    {"id": "%", "type": 0},
    {"id": ":", "type": 1},
    {"id": "7", "type": 0},
    {"id": "8", "type": 0},
    {"id": "9", "type": 0},
    {"id": "X", "type": 1},
    {"id": "4", "type": 0},
    {"id": "5", "type": 0},
    {"id": "6", "type": 0},
    {"id": "-", "type": 1},
    {"id": "1", "type": 0},
    {"id": "2", "type": 0},
    {"id": "3", "type": 0},
    {"id": "+", "type": 1},
    {"id": "0", "type": 0},
    {"id": ".", "type": 0},
    {"id": "del", "type": 0},
    {"id": "=", "type": 2}
  ];

  Widget resolveButton(String value, int type) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: type == 0
              ? const Color(0xFF282828)
              : type == 2
                  ? const Color.fromARGB(255, 170, 105, 0)
                  : const Color.fromARGB(255, 92, 0, 60),
          border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.2)),
      child: Text(
        value,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "2000x60+100",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "120100",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 0.98,
                        children: data
                            .map((e) => resolveButton(e['id'], e['type']))
                            .toList()),
                  ),
                )
              ],
            )));
  }
}