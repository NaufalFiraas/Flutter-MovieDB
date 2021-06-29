import 'package:flutter/widgets.dart';

class Alerts with ChangeNotifier {
  String _alert = '';

  String get alert => this._alert;
  set alert(String value) {
    this._alert = value;
    notifyListeners();
  }
}
