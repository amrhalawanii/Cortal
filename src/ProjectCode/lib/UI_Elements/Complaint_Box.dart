import 'package:cortal/Configuration/Complaint.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Portal/AdminPanel/AdminViewFullComplaintPage.dart';
import 'package:cortal/Pages/Portal/ViewFullComplaintPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ComplaintBox extends StatefulWidget {
  final bool isAdmin;
  final Complaint complaint;

  const ComplaintBox({Key? key, required this.isAdmin, required this.complaint})
      : super(key: key);

  @override
  _ComplaintBoxState createState() => _ComplaintBoxState();
}

class _ComplaintBoxState extends State<ComplaintBox> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.complaint.dateTime);
    final DateFormat dateFormatter = DateFormat('MMM, dd yyyy');
    final DateFormat timeFormatter = DateFormat.jm();
    final String complaintDate = dateFormatter.format(dateTime);
    final String complaintTime = timeFormatter.format(dateTime);

    Color boxColor = widget.complaint.status == 'Pending'
        ? Colors.grey
        : widget.complaint.status == 'Resolved'
            ? Colors.green
            : Colors.red;

    return Container(
      margin: EdgeInsets.all(20),
      height: 185,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: boxColor, width: 5)),
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
                      ? AdminViewFullComplaintPage(complaint: widget.complaint)
                      : ViewFullComplaintPage(
                          complaint: widget.complaint,
                        )));
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.complaint.title,
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
                    widget.complaint.status,
                    style: GoogleFonts.lato(
                        color: boxColor,
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
                    complaintDate,
                    style: GoogleFonts.lato(
                        color: ConstantColors.navyBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(width: 50),
                  Text(
                    complaintTime,
                    style: GoogleFonts.lato(
                        color: ConstantColors.navyBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "View Full ",
                      style:
                          GoogleFonts.lato(color: Colors.grey.withOpacity(0.7)),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.grey.withOpacity(0.7))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FullComplaintBox extends StatefulWidget {
  final Complaint complaint;

  const FullComplaintBox({Key? key, required this.complaint}) : super(key: key);

  @override
  _FullComplaintBoxState createState() => _FullComplaintBoxState();
}

class _FullComplaintBoxState extends State<FullComplaintBox> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.complaint.dateTime);
    final DateFormat dateFormatter = DateFormat('MMM, dd yyyy');
    final DateFormat timeFormatter = DateFormat.jm();
    final String complaintDate = dateFormatter.format(dateTime);
    final String complaintTime = timeFormatter.format(dateTime);

    Color boxColor = widget.complaint.status == 'Pending'
        ? Colors.grey
        : widget.complaint.status == 'Resolved'
            ? Colors.green
            : Colors.red;

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
                border: Border(top: BorderSide(color: boxColor, width: 5)),
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
                        "#${widget.complaint.id}",
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
                        widget.complaint.title,
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
                        complaintDate,
                        style: GoogleFonts.lato(
                            color: ConstantColors.navyBlue, fontSize: 16),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        complaintTime,
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
                        widget.complaint.status,
                        style: GoogleFonts.lato(color: boxColor, fontSize: 16),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  Container(
                    height: 55,
                    width: Device.width,
                    // color: Colors.red,
                    child: Row(
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
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ListView.builder(
                                itemCount: widget.complaint.types.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10.0),
                                      child: Container(
                                          height: 40,
                                          constraints: BoxConstraints(
                                              maxHeight: 40, minWidth: 150),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: ConstantColors.navyBlue
                                                      .withOpacity(0.8),
                                                  blurRadius: 3,
                                                  offset: Offset(1, 1),
                                                ),
                                              ],
                                              color: ConstantColors.navyBlue,
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                widget.complaint.types[index],
                                                style: GoogleFonts.lato(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )),
                                    )),
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),

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
                          child: Text(widget.complaint.description
//                               """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
// Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
// """
                              ),
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
