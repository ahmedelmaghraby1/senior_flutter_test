import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/themes/material_colors.dart';

abstract class AppColorScheme {
  Brightness get brightness;

  MaterialTextColor get textColor;

  Color get primaryColor => Colors.black;

  Color get secondaryColor => const Color(0xffFFC268);

  Color get whiteColor => const Color(0xffFFFFFF);

  Color get containerColor => const Color(0xff262626);

  Color get lightBlack => const Color(0xff171717);

  Color get grey => const Color(0xff999999);

  Color get brown => const Color(0xffC25F30);
  Color get turquoise => const Color(0xff33BFED);

  Color get lightGrey => const Color(0xffD9D9D9);

  Color get dividerColor => const Color(0xff262626);

  Color get errorColor => Colors.red;

  Color get successColor => Colors.green;

  Gradient tripContainerGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Color(0xFF171717).withOpacity(0.5),
      Color(0xFF171717).withOpacity(1),
    ],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentDirectional.bottomCenter,
    stops: [0.1, 0.4, 0.5],
  );
}

class AppDarkColors extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  MaterialTextColor get textColor =>
      const MaterialTextColor(0xffFFFFFF, <TextColor, Color>{
        TextColor.black: Colors.black,
        TextColor.white: Colors.white,
        TextColor.yellow: Color(0xffFFC268),
        TextColor.lightGrey: Color(0xff999999),
      });
}
