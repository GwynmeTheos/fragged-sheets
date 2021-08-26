import 'package:flutter/material.dart';
import 'package:fragged_sheets/pages/pages.dart';

void main() {
  // Initialize stuff here.

  runApp(
    FraggedSheets()
  );
}

class FraggedSheets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fragged Sheets',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Fragged Sheets'),
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('pt', ''), // Portuguese, no country code
        const Locale('es', ''), // Spanish, no country code
      ],
    );
  }
}
