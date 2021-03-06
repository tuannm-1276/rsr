import 'package:flutter/material.dart';
import 'package:mcd01/colors.dart';
import 'package:mcd01/home.dart';
import 'package:mcd01/login.dart';
import 'package:mcd01/supplemental/cut_corners_border.dart';

class ShrineApp extends StatelessWidget {
  final ThemeData _kShrineTheme = _buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _kShrineTheme,
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true);
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonTheme: base.buttonTheme.copyWith(
          buttonColor: kShrinePink100,
          colorScheme: base.colorScheme.copyWith(secondary: kShrineBrown900)),
      buttonBarTheme:
          base.buttonBarTheme.copyWith(buttonTextTheme: ButtonTextTheme.accent),
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: CutCornersBorder(
            borderS: BorderSide(
              width: 2.0,
              color: kShrineBrown900
            )
          ),
          border: CutCornersBorder()));
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline5: base.headline5.copyWith(fontWeight: FontWeight.w500),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          bodyText1: base.bodyText1
              .copyWith(fontWeight: FontWeight.w500, fontSize: 16.0))
      .apply(
          fontFamily: 'Rubik',
          displayColor: kShrineBrown900,
          bodyColor: kShrineBrown900);
}
