import 'package:cortal/Models/Complaint.dart';
import 'package:cortal/Models/User.dart';
import 'package:flutter/material.dart';

///---------------------------------------------------------------------
///--------------------------| Device Dimensions |----------------------
///---------------------------------------------------------------------
class Device {
  static double? height;
  static double? width;
}

///---------------------------------------------------------------------
///-----------------------| Constant & Main Colors |--------------------
///---------------------------------------------------------------------
class ConstantColors {
  static Color primaryRed = const Color(0xFFAD1B02);
  static Color orange = const Color(0xFFD856042);
  static Color yellow = const Color(0xFFF3BE26);
  static Color navyBlue = const Color(0xFF2F2E41);
  static Color accentGrey = const Color(0xFFECECEC);
}

///---------------------------------------------------------------------
///-----------------------| All external images used |------------------
///---------------------------------------------------------------------
class ConstantImages {
  static String registration = "assets/registration/registration.png";
  static String pwcLogo = "assets/pwcLogo.png";
}

///---------------------------------------------------------------------
//---------| Dimensions used for responsivity of ui purposes |----------
///---------------------------------------------------------------------
const kTabletBreakPoint = 768.0;
const kDesktopBreakPoint = 1440.0;
const kSideMenuWidth = 300.0;
const kNavigationRailWidth = 72.0;

bool? isPhone;

CortalUser? activeUser;

String? activeIsAdmin = "NONE";

List<Complaint>? complaintsList;
