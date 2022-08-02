import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// light mode
Color primaryTextColor = Color(0xff151515);
Color secondaryTextColor = Color(0xff747474);
Color btnColor = Color(0xff36BC4C);
Color btnClear = Color(0xffFF5959);
Color bgColor1 = Color(0xffF2F2F2);

// dark mode
Color bgColor2 = Color(0xff1A1A1A);
Color darkPrimaryTextColor = Color(0xffFFFFFF);
Color darkSecondaryTextColor = Color(0xff969696);
Color darkBtnColor = Color(0xff66FF7F);

TextStyle primaryTextStyle = GoogleFonts.inter(color: primaryTextColor);
TextStyle clearTextStyle = GoogleFonts.inter(color: btnClear);
TextStyle secondaryTextStyle = GoogleFonts.inter(color: secondaryTextColor);

TextStyle darkPrimaryTextStyle = GoogleFonts.inter(color: darkPrimaryTextColor);
TextStyle darkSecondaryTextStyle =
    GoogleFonts.inter(color: darkSecondaryTextColor);
