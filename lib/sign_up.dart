import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference/povider.dart';
import 'package:shared_preference/preference_service.dart';

import 'global_border_style.dart';
import 'model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final preferenceService = PreferenceService();
  final _usernameController = TextEditingController();
  late FocusNode nameFocus;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    nameFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text("Setup Page"),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            if (nameFocus.hasFocus) nameFocus.unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Setup Page",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                ListTile(
                  title: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: GlobalBorderStyle.borderStyle,
                      focusedBorder: GlobalBorderStyle.focusBorderStyle,
                      enabledBorder: GlobalBorderStyle.enabledBorderStyle,
                      errorBorder: GlobalBorderStyle.errorBorderStyle,
                      labelText: "Username",
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RadioListTile(
                      title: const Text("Female"),
                      value: Gender.female,
                      groupValue: settingProvider.selectedGender,
                      onChanged: (value) {
                        settingProvider.selectionGender(Gender.female);
                      },
                    ),
                    RadioListTile(
                      title: const Text("Male"),
                      value: Gender.male,
                      groupValue: settingProvider.selectedGender,
                      onChanged: (value) {
                        settingProvider.selectionGender(Gender.male);
                      },
                    ),
                    RadioListTile(
                      title: const Text("Other"),
                      value: Gender.other,
                      groupValue: settingProvider.selectedGender,
                      onChanged: (value) {
                        settingProvider.selectionGender(Gender.other);
                      },
                    ),
                  ],
                ),
                CheckboxListTile(
                  title: const Text("Dart"),
                  value: settingProvider.selectedLanguage
                      .contains(ProgrammingLanguage.dart),
                  onChanged: (value) {
                    settingProvider.selectionSkill(ProgrammingLanguage.dart);
                  },
                ),
                CheckboxListTile(
                  title: const Text("Flutter"),
                  value: settingProvider.selectedLanguage
                      .contains(ProgrammingLanguage.flutter),
                  onChanged: (value) {
                    settingProvider.selectionSkill(ProgrammingLanguage.flutter);
                  },
                ),
                CheckboxListTile(
                  title: const Text("Cubit"),
                  value: settingProvider.selectedLanguage
                      .contains(ProgrammingLanguage.cubit),
                  onChanged: (value) {
                    settingProvider.selectionSkill(ProgrammingLanguage.cubit);
                  },
                ),
                CheckboxListTile(
                  title: const Text("Provider"),
                  value: settingProvider.selectedLanguage
                      .contains(ProgrammingLanguage.provider),
                  onChanged: (value) {
                    settingProvider
                        .selectionSkill(ProgrammingLanguage.provider);
                  },
                ),
                CheckboxListTile(
                  title: const Text("Kotlin"),
                  value: settingProvider.selectedLanguage
                      .contains(ProgrammingLanguage.kotlin),
                  onChanged: (value) {
                    settingProvider.selectionSkill(ProgrammingLanguage.kotlin);
                  },
                ),
                SwitchListTile(
                  title: const Text("Is Employed"),
                  value: settingProvider.isEmployed,
                  onChanged: (value) {
                    settingProvider.employed;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: RawMaterialButton(
                        fillColor: Colors.blue,
                        onPressed: () => saveSetting(provider: settingProvider),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text("Save Settings"),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveSetting({required SettingProvider provider}) {
    SettingModel setModel = SettingModel(
      name: _usernameController.text,
      gender: provider.selectedGender,
      skills: provider.selectedLanguage,
      isEmployeer: provider.isEmployed,
    );
    print(setModel);
    preferenceService.saveSetting(setModel);
  }
}
