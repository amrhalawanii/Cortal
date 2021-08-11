import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Portal/AddComplaintPage.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/Complaint_Box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllComplaintsPage extends StatefulWidget {
  const AllComplaintsPage({Key? key}) : super(key: key);

  @override
  _AllComplaintsPageState createState() => _AllComplaintsPageState();
}

class _AllComplaintsPageState extends State<AllComplaintsPage> {
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
          centerTitle: true,
          elevation: 0.0,
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
                child: ListView.builder(
                    itemCount: 500,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ComplaintBox(
                            isAdmin: false,
                          ),
                        )),
              ),
            );
          }),
        ));
  }
}
