
import 'package:dndlion/model/inventory/ItemTyp.dart';

class Item {

 String name;
 String line1;
 String line2;
 ItemType type;
 Map<String, int> bonuses = new Map();

 Item();

 Item.initWith(this.name, this.line1, this.line2, this.type);

}