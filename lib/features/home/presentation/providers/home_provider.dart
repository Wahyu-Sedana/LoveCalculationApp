import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final TextEditingController _yourName = TextEditingController();
  final TextEditingController _hisName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _yourNameError = false;
  bool _hisNameError = false;

  TextEditingController get yourName => _yourName;
  TextEditingController get hisName => _hisName;
  bool get yourNameError => _yourNameError;
  bool get hisNameError => _hisNameError;
  GlobalKey<FormState> get formKey => _formKey;

  set updateYourName(val) {
    _yourName.text = val;
    notifyListeners();
  }

  set updateHisName(val) {
    _hisName.text = val;
    notifyListeners();
  }

  set setYourNameError(bool val) {
    _yourNameError = val;
    notifyListeners();
  }

  set setHisnameError(bool val) {
    _hisNameError = val;
    notifyListeners();
  }

  void clearInputText() {
    yourName.clear();
    hisName.clear();
    notifyListeners();
  }
}
