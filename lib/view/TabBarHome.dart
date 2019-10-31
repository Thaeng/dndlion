
import 'package:dndlion/model/Character.dart';
import 'package:dndlion/view/tabs/character/CharacterWidget.dart';
import 'package:flutter/material.dart';

class TabBarHome{

  DefaultTabController _tabController;
  Character character = Character();

  TabBarHome(){
    _initTabBarHome();
  }

  void _initTabBarHome(){
    _tabController = DefaultTabController(
      length: 1,
      child: _buildChild(),
    );
  }

  DefaultTabController getHome(){
    return this._tabController;
  }

  Scaffold _buildChild(){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: _buildTabBar(),
        ),
      ),
      body: _buildBody(),
    );
  }

  TabBar _buildTabBar(){
    return TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(Icons.person)),
      ],
    );
  }

  TabBarView _buildBody(){
    return TabBarView(
      children: <Widget>[
        CharacterWidget(character: character),
      ],
    );
  }
}