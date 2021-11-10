import 'package:auth/app/app_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (_, i) {
            return const ListTile(
              title: Text('Testando'),
            );
          }),
      drawer: AppDrawer(),
    );
  }
}
