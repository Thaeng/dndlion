
import 'package:dndlion/model/Health.dart';
import 'package:dndlion/model/Skill.dart';
import 'package:dndlion/model/Stat.dart';
import 'package:dndlion/model/StatNames.dart';
import 'package:dndlion/model/inventory/Inventory.dart';
import 'package:flutter/cupertino.dart';

class Character {

  static const int _baseStatValue = 10;
  static const int _baseSkillValue = 0;
  static const bool _baseProficient = false;

  static const List<String> _strengthSkills = ["Athletics"];
  static const List<String> _dexteritySkills = ["Acrobatics", "Sleight of Hand", "Stealth"];
  static const List<String> _constitutionSkills = [];
  static const List<String> _intelligenceSkills = ["Arcana", "History", "Investigation", "Nature", "Religion"];
  static const List<String> _wisdomSkills = ["Animal Handling", "Insight", "Medicine", "Perception", "Survival"];
  static const List<String> _charismaSkills = ["Deception", "Intimidation", "Performance", "Persuasion"];

  List<Stat> _stats;
  int _proficiencyBonus;
  Health _health;

  Inventory inventory = Inventory();
  int armorClass;
  int speed;
  String name;
  Image image = Image(image: AssetImage('resources/template.jpg'));

  Character(){
    this._stats = createStats();
    this._proficiencyBonus = 2;
    this.armorClass = 10;
    this.speed = 30;
    this.name = "Daniel";
    this._health = Health.initWith(20,15,0);

    updateSkills();
  }
  

  List<Stat> createStats(){
    List<Stat> stats = List();

    stats.add(Stat(StatNames.strength.toString(), _baseStatValue, createSkills(_strengthSkills)));
    stats.add(Stat(StatNames.dexterity.toString(), _baseStatValue, createSkills(_dexteritySkills)));
    stats.add(Stat(StatNames.constitution.toString(), _baseStatValue, createSkills(_constitutionSkills)));
    stats.add(Stat(StatNames.intelligence.toString(), _baseStatValue, createSkills(_intelligenceSkills)));
    stats.add(Stat(StatNames.wisdom.toString(), _baseStatValue, createSkills(_wisdomSkills)));
    stats.add(Stat(StatNames.charisma.toString(), _baseStatValue, createSkills(_charismaSkills)));

    return stats;
  }

  List<Skill> createSkills(List<String> skillNames){
    List<Skill> skills = List();
    skillNames.forEach((skillName) => skills.add(Skill(skillName, _baseSkillValue, _baseProficient)));
    return skills;
  }

  void updateSkills(){
    _stats.forEach((stat) => stat.updateSkills(_proficiencyBonus));
  }

  Stat getStatByName(String statName){
    return stats.singleWhere((stat) => statName == stat.name, orElse: () => null);
  }

  void increaseStatByOne(String statName){
    Stat stat = stats.singleWhere((stat) => statName == stat.name, orElse: () => null);
    if(stat == null) return;
    stat.increaseByOne();
    stat.updateSkills(_proficiencyBonus);
  }

  void decreaseStatByOne(String statName){
    Stat stat = stats.singleWhere((stat) => statName == stat.name, orElse: () => null);
    if(stat == null) return;
    stat.decreaseByOne();
    stat.updateSkills(_proficiencyBonus);
  }

  void takeDamage(int amount){
    health.takeDamage(amount);
  }

  // ### Getter ###
  Health get health => _health;

  int get proficiencyBonus => _proficiencyBonus;

  List<Stat> get stats => _stats;


}