import 'package:shared_preference/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  Future saveSetting(SettingModel settingModel) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString("name", settingModel.name);
    await sharedPreferences.setInt("gender", settingModel.gender.index);
    await sharedPreferences.setBool("isEmployed", settingModel.isEmployeer);
    await sharedPreferences.setStringList(
      "skill",
      settingModel.skills.map((skill) => skill.index.toString()).toList(),
    );
  }
}
