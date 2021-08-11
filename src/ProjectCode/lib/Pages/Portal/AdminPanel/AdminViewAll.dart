import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/Complaint_Box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminViewAllComplaintsPage extends StatefulWidget {
  const AdminViewAllComplaintsPage({Key? key}) : super(key: key);

  @override
  _AdminViewAllComplaintsPageState createState() =>
      _AdminViewAllComplaintsPageState();
}

class _AdminViewAllComplaintsPageState
    extends State<AdminViewAllComplaintsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------------
      //----------------------- App Bar -----------------------------
      //-------------------------------------------------------------
      appBar: AppBar(
        backgroundColor: ConstantColors.navyBlue,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "View All Complaints",
          style: GoogleFonts.lato(color: Colors.white),
        ),
      ),

      //---------------------------------------------------------
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
              child: ListView.builder(
                  itemCount: 500,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ComplaintBox(
                          isAdmin: true,
                        ),
                      )),
            ),
          );
        }),
      ),
    );
  }
}
