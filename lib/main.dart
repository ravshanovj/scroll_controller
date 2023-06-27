import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  Color containerColor = Colors.white;
  int containerIndex = 0;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset == 0 && scrollController.offset < 215) {
          containerColor = Colors.green;
          containerIndex = 1;
        } else if (scrollController.offset > 215 &&
            scrollController.offset < 430) {
          containerColor = Colors.blue;
          containerIndex = 2;
        } else if (scrollController.offset > 430 &&
            scrollController.offset < 650) {
          containerColor = Colors.red;
          containerIndex = 3;
        } else if (scrollController.offset > 650 &&
            scrollController.offset < 860) {
          containerColor = Colors.purple;
          containerIndex = 4;
        }
        debugPrint(scrollController.offset.toString());
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8),
              width: 400,
              height: 200,
              color:
                  index == containerIndex ? containerColor : Colors.grey[300],
            );
          },
          controller: scrollController,
        ),
      ),
    );
  }
}