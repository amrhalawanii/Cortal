import 'package:cortal/Configuration/Complaint.dart';
import 'package:cortal/Configuration/api_manager.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/Complaint_Box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminViewFullComplaintPage extends StatelessWidget {
  final Complaint complaint;
  const AdminViewFullComplaintPage({Key? key, required this.complaint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.navyBlue,
      ),
      body: BackgroundWithNoCard(
          child: Center(
              child: SingleChildScrollView(
                  child: Column(
        children: [
          FullComplaintBox(
            complaint: complaint,
          ),
          SizedBox(height: 30),
          complaint.status == "Pending"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        API_Manager().resolveComplaint(context, complaint.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text('Resolve',
                                style: GoogleFonts.lato(color: Colors.white)),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.check, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        API_Manager().dismissComplaint(context, complaint.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text('Dismiss',
                                style: GoogleFonts.lato(color: Colors.white)),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.cancel_outlined, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      )))),
    );
  }
}
