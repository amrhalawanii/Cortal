import 'dart:html';

import 'package:cortal/Configuration/Complaint.dart';
import 'package:cortal/Configuration/SharedPreferencesMethods.dart';
import 'package:cortal/Configuration/api_manager.dart';
import 'package:cortal/Configuration/auth.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Portal/AdminPanel/AdminViewAll.dart';
import 'package:cortal/Pages/Registration/Login/LoginPage.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/Circular_progrss.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  _AdminPanelPageState createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  List<Complaint> complaints = [];
  bool _isLoading = true;
  late List<CTAData> _chartData;

  int counterPending = 0;
  int counterResolved = 0;
  int counterDismissed = 0;

  void initState() {
    Future.delayed(Duration.zero).then((_) {
      API_Manager().get_All_complaints(context).then((list) {
        for (var complaint in list) {
          if (complaint.status == 'Pending') {
            counterPending++;
          } else if (complaint.status == 'Resolved') {
            counterResolved++;
          } else {
            counterDismissed++;
          }
        }
        setState(() {
          complaints = list;
          _chartData = getChartData();
          _isLoading = false;
        });
        // print(complaintsList);
      });
    });
    // TODO: implement initState
    super.initState();
  }

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
        leading: Container(),
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
        title: Text(
          "Admin Panel",
          style: GoogleFonts.lato(color: Colors.white),
        ),
      ),

      body: BackgroundWithNoCard(
        child: LayoutBuilder(builder: (context, constraints) {
          isPhone = constraints.maxWidth < kTabletBreakPoint;
          return _isLoading
              ? ShowCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildPieChart(),
                        //-------------------------------------------------------------
                        //----------------------- Status Boxes ------------------------
                        //-------------------------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //-------------------------------------------------------------
                            //----------------------- Pending Box -------------------------
                            //-------------------------------------------------------------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: isPhone!
                                    ? Device.width! * 0.25
                                    : Device.width! * 0.15,
                                width: isPhone!
                                    ? Device.width! * 0.25
                                    : Device.width! * 0.15,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 5)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.refresh_outlined,
                                      color: Colors.grey,
                                      size: isPhone! ? 25 : 50,
                                    ),
                                    Text(
                                      counterPending.toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: isPhone!
                                              ? 18
                                              : Device.width! * 0.022,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Pending",
                                      style: GoogleFonts.lato(
                                          fontSize: isPhone!
                                              ? 16
                                              : Device.width! * 0.015,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: isPhone! ? 0 : 20,
                            ),
                            //-------------------------------------------------------------
                            //----------------------- Resolved Box ------------------------
                            //-------------------------------------------------------------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: isPhone!
                                    ? Device.width! * 0.25
                                    : Device.width! * 0.15,
                                width: isPhone!
                                    ? Device.width! * 0.25
                                    : Device.width! * 0.15,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.green, width: 5)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: isPhone! ? 25 : 50,
                                    ),
                                    Text(
                                      counterResolved.toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: isPhone!
                                              ? 18
                                              : Device.width! * 0.022,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Resolved",
                                      style: GoogleFonts.lato(
                                          fontSize: isPhone!
                                              ? 16
                                              : Device.width! * 0.015,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: isPhone! ? 0 : 20,
                            ),
                            //-------------------------------------------------------------
                            //----------------------- Dismissed Box -----------------------
                            //-------------------------------------------------------------
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: isPhone!
                                    ? Device.width! * 0.25
                                    : Device.width! * 0.15,
                                width: isPhone!
                                    ? Device.width! * 0.25
                                    : Device.width! * 0.15,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.red, width: 5)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: isPhone! ? 25 : 50,
                                    ),
                                    Text(
                                      counterDismissed.toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: isPhone!
                                              ? 18
                                              : Device.width! * 0.022,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Dismissed",
                                      style: GoogleFonts.lato(
                                          fontSize: isPhone!
                                              ? 16
                                              : Device.width! * 0.015,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        //-------------------------------------------------------------
                        //----------------------- See All Button ----------------------
                        //-------------------------------------------------------------

                        Container(
                          height: 50,
                          width: Device.width! * 0.49,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AdminViewAllComplaintsPage()));
                              },
                              child: Text(
                                "See All",
                                style: GoogleFonts.lato(
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: ConstantColors.navyBlue,
                                primary: ConstantColors.navyBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0)),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }

  buildPieChart() {
    return SfCircularChart(
      series: <CircularSeries>[
        PieSeries<CTAData, String>(
            dataSource: _chartData,
            xValueMapper: (CTAData data, _) => data.title,
            yValueMapper: (CTAData data, _) => data.num,
            dataLabelMapper: (CTAData data, _) => data.title,
            startAngle: 100,
            endAngle: 100,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, labelPosition: ChartDataLabelPosition.outside))
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<CTAData> getChartData() {
    int extraCharge = 0;
    int serviceDelay = 0;
    int reportStaff = 0;
    int covid = 0;
    int other = 0;

    for (var complaint in complaints) {
      for (var type in complaint.types) {
        switch (type) {
          case 'Extra Charge':
            extraCharge++;
            break;
          case 'Service Delay':
            serviceDelay++;
            break;
          case 'Report Staff':
            reportStaff++;
            break;
          case 'Issue related to COVID-19':
            covid++;
            break;

          case 'Other':
            other++;
            break;
        }
      }
    }
    final List<CTAData> chartData = [
      CTAData(
        "Extra Charge",
        extraCharge,
      ),
      CTAData(
        "Service Delay",
        serviceDelay,
      ),
      CTAData(
        "Report Staff",
        reportStaff,
      ),
      CTAData(
        "Issue related to COVID-19",
        covid,
      ),
      CTAData(
        "Other",
        other,
      ),
    ];

    return chartData;
  }
}

class CTAData {
  final String title;
  final int num;

  CTAData(this.title, this.num);
}
