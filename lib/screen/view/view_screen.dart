import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    List index=ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(child: Scaffold(
      body: Text("${index.}"),
    ),);
  }
}
