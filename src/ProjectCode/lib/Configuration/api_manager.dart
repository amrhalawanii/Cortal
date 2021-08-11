import 'package:cortal/Configuration/Complaint.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Helpers/ShowMessage.dart';
import 'package:cortal/Pages/Portal/AdminPanel/AdminPanel.dart';
import 'package:cortal/Pages/Portal/AllComplaintsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API_Manager {
  var client = http.Client();
  final url = Uri.parse(
      "https://cortal-80f5f-default-rtdb.firebaseio.com/complaints.json");

  add_complaint(BuildContext context, Complaint complaint) {
    http
        .post(url,
            body: json.encode({
              'id': complaint.id,
              'senderId': complaint.senderId,
              'title': complaint.title,
              'dateTime': complaint.dateTime,
              'status': complaint.status,
              'description': complaint.description,
              'types': complaint.types
            }))
        .then((response) {
      // print(jsonDecode(response.body));

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AllComplaintsPage()));
    }).catchError((e) {
      print("===========| ERROR |========| " + e.toString());
      ShowMessage().showErrorDialog(context, "Error", e.toString());
      Navigator.of(context).pop();
    });
  }

  Future get_All_complaints(BuildContext context) async {
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map;
      complaintsList?.clear();

      final List<Complaint> allComplaints = [];
      extractedData.forEach((comId, comData) {
        allComplaints.add(new Complaint(
            comId,
            comData['senderId'],
            comData['title'],
            comData['dateTime'],
            comData['status'],
            comData['description'],
            comData['types']));
      });
      return allComplaints;
    } catch (e) {
      ShowMessage().showErrorDialog(context, "Error 59", e.toString());
    }
  }

  Future get_complaints(BuildContext context, String senderId) async {
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map;

      print(senderId);

      final List<Complaint> complaints = [];
      extractedData.forEach((comId, comData) {
        complaints.add(new Complaint(
            comId,
            comData['senderId'],
            comData['title'],
            comData['dateTime'],
            comData['status'],
            comData['description'],
            comData['types']));
      });

      return complaints;
    } catch (e) {
      ShowMessage().showErrorDialog(context, "Error 61", e.toString());
    }
  }

  resolveComplaint(BuildContext context, String id) async {
    final url = Uri.parse(
        "https://cortal-80f5f-default-rtdb.firebaseio.com/complaints/$id.json");

    try {
      final response =
          await http.patch(url, body: json.encode({'status': 'Resolved'}));
      if (response.statusCode >= 400) {
        ShowMessage().showErrorDialog(
            context, "Error", "Couldn't resolve issue, try again later");
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminPanelPage()));
    } catch (e) {
      ShowMessage().showErrorDialog(context, "Error 78", e.toString());
    }
  }

  dismissComplaint(BuildContext context, String id) async {
    final url = Uri.parse(
        "https://cortal-80f5f-default-rtdb.firebaseio.com/complaints/$id.json");

    try {
      final response =
          await http.patch(url, body: json.encode({'status': 'Dismissed'}));
      if (response.statusCode >= 400) {
        ShowMessage().showErrorDialog(
            context, "Error", "Couldn't dismiss issue, try again later");
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminPanelPage()));
    } catch (e) {
      ShowMessage().showErrorDialog(context, "Error 78", e.toString());
    }
  }
}
