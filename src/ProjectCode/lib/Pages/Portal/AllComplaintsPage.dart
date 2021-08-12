import 'dart:convert';

import 'package:cortal/Configuration/Complaint.dart';
import 'package:cortal/Configuration/SharedPreferencesMethods.dart';
import 'package:cortal/Configuration/api_manager.dart';
import 'package:cortal/Configuration/auth.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Portal/AddComplaintPage.dart';
import 'package:cortal/Pages/Registration/Login/LoginPage.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/Circular_progrss.dart';
import 'package:cortal/UI_Elements/Complaint_Box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllComplaintsPage extends StatefulWidget {
  const AllComplaintsPage({Key? key}) : super(key: key);

  @override
  _AllComplaintsPageState createState() => _AllComplaintsPageState();
}

class _AllComplaintsPageState extends State<AllComplaintsPage> {
  bool _isLoading = true;

  List<Complaint> complaints = [];
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      API_Manager().get_complaints(context, activeUser!.userId).then((list) {
        setState(() {
          complaints = list;
          _isLoading = false;
        });

        // print(complaintsList);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///--------------------------------------------------------------------------------
        ///---------------------------------- App Bar  ------------------------------------
        ///--------------------------------------------------------------------------------
        appBar: AppBar(
          title: Text(
            "All Complaints",
            style: GoogleFonts.lato(color: Colors.white),
          ),
          leading: Container(),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    SharedPreferencesMethods.clearSharedPreferences();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) => LoginPage()));
                  });
                },
                icon: Icon(Icons.logout_outlined))
          ],
        ),

        ///--------------------------------------------------------------------------------
        ///---------------------------------- Add Complaint Button  -----------------------
        ///--------------------------------------------------------------------------------
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddComplaintPage()));
          },
          backgroundColor: ConstantColors.primaryRed,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),

        ///--------------------------------------------------------------------------------
        ///---------------------------------- Body  ---------------------------------------
        ///--------------------------------------------------------------------------------
        body: BackgroundWithNoCard(
          child: LayoutBuilder(builder: (context, constraints) {
            isPhone = constraints.maxWidth < kTabletBreakPoint;
            return Center(
              child: Container(
                width: isPhone! ? Device.width! : Device.width! * 0.4,
                height: Device.height! * 0.8,
                // color: Colors.red,

                ///--------------------------------------------------------------------------------
                ///---------------------------------- List Of Complaints  -------------------------
                ///--------------------------------------------------------------------------------
                child: _isLoading
                    ? ShowCircularProgressIndicator()
                    : ListView.builder(
                        itemCount: complaints.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: complaints[index].senderId ==
                                      activeUser!.userId
                                  ? ComplaintBox(
                                      isAdmin: false,
                                      complaint: complaints[index],
                                    )
                                  : Container(),
                            )),
              ),
            );
          }),
        ));
  }
}
