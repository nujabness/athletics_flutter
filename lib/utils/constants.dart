import 'package:flutter/material.dart';

final kTextStyle = TextStyle(
   fontFamily: 'OpenSans',
   fontSize: 22,
);

final kTextStyleW = TextStyle(
   fontFamily: 'OpenSans',
   color: Colors.white,
   fontSize: 15,
);

final kTextColorStyle = TextStyle(
   fontFamily: 'OpenSans',
   fontSize: 22,
   color: Color(0xFFE57373),
   fontWeight: FontWeight.bold,
);

final kHintTextStyle = TextStyle(
   color: Colors.white54,
   fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
   color: Colors.white,
   fontWeight: FontWeight.bold,
   fontFamily: 'OpenSans',
);

final kLabelStyleDark = TextStyle(
   color: Color(0xFFE57373),
   fontWeight: FontWeight.bold,
   fontFamily: 'OpenSans',
);

final kLabelDDStyleDark = TextStyle(
   color: Colors.white,
   fontWeight: FontWeight.bold,
   fontFamily: 'OpenSans',
   backgroundColor: Color(0xFFE57373)
);

final kBoxDecorationStyle = BoxDecoration(
   color: Color(0xFFE57373),
   borderRadius: BorderRadius.circular(10.0),
   boxShadow: [
      BoxShadow(
         color: Color(0xFFE57373),
         blurRadius: 6.0,
         offset: Offset(0, 2),
      ),
   ],
);