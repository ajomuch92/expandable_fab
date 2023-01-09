import 'package:flutter/material.dart';
import 'package:full_expandable_fab/full_expandable_fab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final GlobalKey<ExpandableFabState> keyFab = GlobalKey<ExpandableFabState>();

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullExpandableFab(
      key: keyFab,
      backgroundColor: Colors.white,
      closeIconColor: Colors.black,
      duration: const Duration(milliseconds: 500),
      innerChild: Column(
        children: [
          const Text('Inner widget'),
          const TextField(),
          ElevatedButton(
            onPressed: () {
              keyFab.currentState?.close();
            }, 
            child: const Text('Close me')
          )
        ],
      ),
      icon: const Icon(Icons.plus_one, color: Colors.white,),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(
          child: Text(
            'Hello, World!',
          ),
        ),
      ),
    );
  }
}
