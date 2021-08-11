import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddComplaintPage extends StatefulWidget {
  const AddComplaintPage({Key? key}) : super(key: key);

  @override
  _AddComplaintPageState createState() => _AddComplaintPageState();
}

class _AddComplaintPageState extends State<AddComplaintPage> {
  bool value = false;
  final complaintsTypes = [
    CheckBoxState(title: 'Extra Charge'),
    CheckBoxState(title: 'Service Delay'),
    CheckBoxState(title: 'Report Staff'),
    CheckBoxState(title: 'Issue related to COVID-19'),
    CheckBoxState(title: 'Other'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--------------------------------------------------------------------------------
      ///---------------------------------- App Bar  ------------------------------------
      ///--------------------------------------------------------------------------------
      // appBar: AppBar(
      //   title: Text(
      //     "Add a new complaint",
      //     style: GoogleFonts.lato(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      body: BackgroundWithLargeCard(
        child: LayoutBuilder(builder: (context, constraints) {
          isPhone = constraints.maxWidth < kTabletBreakPoint;
          return Form(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //-----------------------------------------------------------------------
                    //------------------------------ Exit Button ----------------------------
                    //-----------------------------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close_rounded,
                            color: ConstantColors.primaryRed,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    //-----------------------------------------------------------------------
                    //------------------------------ Add Complaint Label --------------------
                    //-----------------------------------------------------------------------
                    Text(
                      'Add Complaint',
                      style: GoogleFonts.lato(
                        fontSize: isPhone! ? 30 : Device.width! * 0.020,
                        color: ConstantColors.navyBlue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.0),

                    //-----------------------------------------------------------------------
                    //--------------------------- Complaint Title ---------------------------
                    //-----------------------------------------------------------------------
                    TextFormField(
                      decoration: InputDecoration(
                          focusColor: ConstantColors.navyBlue,
                          hoverColor: ConstantColors.accentGrey,
                          enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: ConstantColors.navyBlue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: ConstantColors.navyBlue)),
                          border: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: ConstantColors.navyBlue)),
                          labelText: "Complaint Title *",
                          labelStyle: TextStyle(
                              fontSize: 18, color: ConstantColors.navyBlue),
                          filled: true),
                    ),
                    const Divider(
                      height: 60,
                    ),

                    //-----------------------------------------------------------------------
                    //--------------------------- Complaint Type ---------------------------
                    //-----------------------------------------------------------------------
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Complaint Type *",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ConstantColors.navyBlue),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // color: Colors.green,
                      width:
                          isPhone! ? Device.width! * 0.8 : Device.width! * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...complaintsTypes.map(buildSingleCheckBox).toList()
                        ],
                      ),
                    ),

                    //-----------------------------------------------------------------------
                    //------------------------- Complaint Description -----------------------
                    //-----------------------------------------------------------------------

                    const Divider(
                      height: 60,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          focusColor: ConstantColors.navyBlue,
                          hoverColor: ConstantColors.accentGrey,
                          enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: ConstantColors.navyBlue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: ConstantColors.navyBlue)),
                          border: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: ConstantColors.navyBlue)),
                          labelText: "Complaint Description *",
                          labelStyle: TextStyle(
                              fontSize: 18, color: ConstantColors.navyBlue),
                          filled: true),
                      maxLines: 12,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //-----------------------------------------------------------------------
                    //-------------------------Send Complaint Button ------------------------
                    //-----------------------------------------------------------------------

                    Container(
                      height: 50,
                      width: Device.width! * 0.8,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Send Complaint",
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
            ),
          );
        }),
      ),
    );
  }

  buildSingleCheckBox(CheckBoxState checkBox) {
    return CheckboxListTile(
        activeColor: ConstantColors.primaryRed,
        title: Text(checkBox.title),
        value: checkBox.value,
        onChanged: (val) {
          setState(() {
            checkBox.value = val!;
          });
        });
  }
}

class AddComplaintForm extends StatefulWidget {
  const AddComplaintForm({Key? key}) : super(key: key);

  @override
  _AddComplaintFormState createState() => _AddComplaintFormState();
}

class _AddComplaintFormState extends State<AddComplaintForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Complaint Title *',
              labelStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.bold, color: ConstantColors.navyBlue),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: ConstantColors.navyBlue),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ConstantColors.navyBlue),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ConstantColors.navyBlue)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Complaint Type",
            style: GoogleFonts.lato(
                color: ConstantColors.navyBlue, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({required this.title, this.value = false});
}
