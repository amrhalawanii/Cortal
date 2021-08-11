import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/Complaint_Box.dart';
import 'package:flutter/material.dart';

class ViewFullComplaintPage extends StatefulWidget {
  const ViewFullComplaintPage({Key? key}) : super(key: key);

  @override
  _ViewFullComplaintPageState createState() => _ViewFullComplaintPageState();
}

class _ViewFullComplaintPageState extends State<ViewFullComplaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BackgroundWithNoCard(
          child:
              Center(child: SingleChildScrollView(child: FullComplaintBox()))),
    );
  }
}
