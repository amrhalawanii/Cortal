import 'package:cortal/Configuration/Complaint.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/Complaint_Box.dart';
import 'package:flutter/material.dart';

class ViewFullComplaintPage extends StatefulWidget {
  final Complaint complaint;

  const ViewFullComplaintPage({Key? key, required this.complaint})
      : super(key: key);
  @override
  _ViewFullComplaintPageState createState() => _ViewFullComplaintPageState();
}

class _ViewFullComplaintPageState extends State<ViewFullComplaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BackgroundWithNoCard(
          child: Center(
              child: SingleChildScrollView(
                  child: FullComplaintBox(
        complaint: widget.complaint,
      )))),
    );
  }
}
