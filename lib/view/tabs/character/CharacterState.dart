
import 'package:dndlion/model/Character.dart';
import 'package:dndlion/model/Stat.dart';
import 'package:dndlion/view/tabs/character/CharacterWidget.dart';
import 'package:flutter/material.dart';

class CharacterState extends State<CharacterWidget> {

  Character _character;

  CharacterState(){
    this._character = Character();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Scaffold _buildScaffold(){
      return Scaffold(
        body: _buildBody(),
      );
  }

  Widget _buildBody(){
    ListView listView = ListView.builder(
        itemCount: _character.stats.length * 2 + 1,
        itemBuilder: (context, i){
          if(i.isOdd) return Divider();
          return _buildRow(i);
    });
    return listView;
  }

  Widget _buildRow(int index){
    if(index == 0){
      return Image.network('https://cache.desktopnexus.com/thumbseg/2015/2015317-bigthumbnail.jpg');
    }


    final Stat stat = _character.stats[index ~/ 2 - 1];
    ExpansionTile listTile = ExpansionTile(
      title: _createTitleFromStat(stat),
      children: _buildSkills(stat),
      leading: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _character.increaseStatByOne(stat.name);
          });
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.remove),
        onPressed: () {
          setState(() {
            _character.decreaseStatByOne(stat.name);
          });
        },
      ),
    );
    return listTile;
  }

  Text _createTitleFromStat(Stat stat){
    return Text(stat.name + " : " + stat.value.toString());
  }

  List<Widget> _buildSkills(Stat stat){
    List<Widget> widgets = List();

    stat.skills.forEach((skill) => widgets.add(
      Container(
        color: Colors.grey,
        child: ListTile(
          title: Text(skill.name + ":" + skill.value.toString()),
          leading: Checkbox(
            value: skill.proficient,
            onChanged: (bool value) {
              setState(() {
                skill.proficient = value;
                _character.updateSkills();
              });
            },
          ),
        ),
      )
    ));
    return widgets;
  }

}