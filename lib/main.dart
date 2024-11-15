import 'package:flutter/material.dart';
import 'package:forms/form_a.dart';
import 'package:forms/form_b.dart';
import 'package:forms/form_c.dart';
import 'package:forms/form_d.dart';

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
          scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Mauro Dev'),
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...buildDialogButtons(context),
            ...buildFormButtons(context),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildDialogButtons(BuildContext context) {
  return [
    OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
      ),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('SimpleDialog Mauro'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('hola prova 1'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('SimpleDialog'),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.cyan,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            showDialog(
                context: context,
              barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('alertDialog Mauro'),
                    content: const Text('hola prova 2'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Ok!'),
                      ),
                    ],
                  );
                },
            );
          },
          child: const Text('AlertDialog'),
      ),
    ),
    Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('hola prova 3'),
                duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Text('SnackBar'),
      ),
    ),
    Padding(
        padding: const EdgeInsets.only(top: 16.0),
    child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('hola prova 4'),
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                );
              },
          );
        },
        child: const Text('Modal Bottom Sheet'),
     ),
    ),
  ];
}

List<Widget> buildFormButtons(BuildContext context) {
  return [
    Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormA()),
            );
          },
          child: Text('Go to FormA'),
        ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormB()),
          );
        },
        child: Text('Go to FormB'),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormC()),
          );
        },
        child: Text('Go to FormC'),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormD()),
          );
        },
        child: Text('Go to FormD'),
      ),
    ),
  ];
}