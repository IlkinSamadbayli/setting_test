import 'package:shared_preference/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  Future saveSetting(SettingModel settingModel) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString("name", settingModel.name);
    await sharedPreferences.setInt("gender", settingModel.gender.index);
    await sharedPreferences.setBool("isEmployed", settingModel.isEmployeer);
    await sharedPreferences.setStringList("skill",
        settingModel.skills.map((skill) => skill.index.toString()).toList());
    print("Saved settings");
  }

   

  Future<SettingModel> getSetting() async {
    final preference = await SharedPreferences.getInstance();
    final name = preference.getString("name")!;
    final isEmployeer = preference.getBool("isEmployed")!;
    final gender = Gender.values[preference.getInt("gender")!];
    final programmingLanguage = preference.getStringList("skill");
    final skills = programmingLanguage!
        .map((e) => ProgrammingLanguage.values[int.parse(e)])
        .toSet();

    return SettingModel(
        gender: gender, name: name, isEmployeer: isEmployeer, skills: skills);
  }
}
