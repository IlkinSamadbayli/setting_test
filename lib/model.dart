// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Gender { male, female, other }

enum ProgrammingLanguage {
  dart,
  flutter,
  kotlin,
  cubit,
  provider
}

class SettingModel {
  final String name;
  final Gender gender;
  final Set<ProgrammingLanguage> skills;
  final bool isEmployeer;
  SettingModel({
    required this.name,
    required this.gender,
    required this.skills,
    required this.isEmployeer,
  });
}
