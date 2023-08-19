import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Imagens'),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
            ),
            Center(
              child: Container(
                width: 300,
                height: 200,
                color: Colors.red,
              ),
            ),
            Image.asset(
              'assets/images/cat.png',
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
        // body: Image.network(
        //     'https://w7.pngwing.com/pngs/247/911/png-transparent-dog-grooming-cat-puppy-pet-adoption-dog-animals-pet-dog-like-mammal.png'),
      ),
    );
  }
}
