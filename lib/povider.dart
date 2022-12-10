import 'package:flutter/cupertino.dart';
import 'package:shared_preference/model.dart';

class SettingProvider with ChangeNotifier {
  late Gender selectedGender = Gender.female;
  var selectedLanguage = <ProgrammingLanguage>{};
  bool isEmployed = false;

  void selectionGender(Gender value) {
    selectedGender = value;
    notifyListeners();
  }

  void selectionSkill(ProgrammingLanguage value) {
    selectedLanguage.contains(value)
        ? selectedLanguage.remove(value)
        : selectedLanguage.add(value);
    notifyListeners();
  }

  void get employed {
    isEmployed = !isEmployed;
    notifyListeners();
  }
}
