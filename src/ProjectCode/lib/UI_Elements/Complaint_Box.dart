import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Portal/AdminPanel/AdminViewFullComplaintPage.dart';
import 'package:cortal/Pages/Portal/ViewFullComplaintPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintBox extends StatefulWidget {
  final bool isAdmin;

  const ComplaintBox({Key? key, required this.isAdmin}) : super(key: key);

  @override
  _ComplaintBoxState createState() => _ComplaintBoxState();
}

class _ComplaintBoxState extends State<ComplaintBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 185,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: ConstantColors.primaryRed, width: 5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3),
            )
          ]),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => widget.isAdmin
                      ? AdminViewFullComplaintPage()
                      : ViewFullComplaintPage()));
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Title",
                  style: GoogleFonts.lato(
                      color: ConstantColors.navyBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Status: ",
                    style: GoogleFonts.lato(
                        color: ConstantColors.navyBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Pending ",
                    style: GoogleFonts.lato(
                        color: ConstantColors.navyBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Date & Time: ",
                    style: GoogleFonts.lato(
                        color: ConstantColors.navyBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "15th May 2021 ",
                    style: GoogleFonts.lato(
                        color: ConstantColors.navyBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(width: 50),
                  Text(
                    "10 AM ",
                    style: GoogleFonts.lato(
                        color: ConstantColors.navyBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Text(
                  "Type: ",
                  style: GoogleFonts.lato(
                      color: ConstantColors.navyBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Extra Charge ",
                  style: GoogleFonts.lato(
                      color: ConstantColors.navyBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class FullComplaintBox extends StatefulWidget {
  const FullComplaintBox({Key? key}) : super(key: key);

  @override
  _FullComplaintBoxState createState() => _FullComplaintBoxState();
}

class _FullComplaintBoxState extends State<FullComplaintBox> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      isPhone = constraints.maxWidth < kTabletBreakPoint;
      Device.width = MediaQuery.of(context).size.width;
      return Center(
        child: Padding(
          padding: isPhone!
              ? const EdgeInsets.symmetric(horizontal: 10.0)
              : const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            width: isPhone! ? Device.width : Device.width! * 0.5,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context).primaryColor, width: 5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //-------------------------------------------------------------
                  //----------------------- Complaint Id-------------------------
                  //-------------------------------------------------------------
                  Row(
                    children: [
                      Text(
                        "Id: ",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.navyBlue),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "#154785",
                        style: GoogleFonts.lato(
                            color: ConstantColors.navyBlue, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //-------------------------------------------------------------
                  //----------------------- Complaint Title----------------------
                  //-------------------------------------------------------------
                  Row(
                    children: [
                      Text(
                        "Title: ",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.navyBlue),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "title",
                        style: GoogleFonts.lato(
                            color: ConstantColors.navyBlue, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //-------------------------------------------------------------
                  //----------------------- Complaint Date ----------------------
                  //-------------------------------------------------------------
                  Row(
                    children: [
                      Text(
                        "Date & Time: ",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.navyBlue),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "15th May 2021",
                        style: GoogleFonts.lato(
                            color: ConstantColors.navyBlue, fontSize: 16),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "15th May 2021",
                        style: GoogleFonts.lato(
                            color: ConstantColors.navyBlue, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //-------------------------------------------------------------
                  //----------------------- Complaint Status --------------------
                  //-------------------------------------------------------------
                  Row(
                    children: [
                      Text(
                        "Status: ",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.navyBlue),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Pending..",
                        style: GoogleFonts.lato(
                            color: ConstantColors.navyBlue, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //-------------------------------------------------------------
                  //----------------------- Complaint Type ----------------------
                  //-------------------------------------------------------------
                  Row(
                    children: [
                      Text(
                        "Type: ",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.navyBlue),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Extra Charge",
                        style: GoogleFonts.lato(
                            color: ConstantColors.navyBlue, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //-------------------------------------------------------------
                  //----------------------- Complaint Description ---------------
                  //-------------------------------------------------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description ",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.navyBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints: new BoxConstraints(
                          minHeight: Device.height! * 0.40,
                          minWidth: Device.width!,
                        ),
                        color: Color(0xFFF0F0F0),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
