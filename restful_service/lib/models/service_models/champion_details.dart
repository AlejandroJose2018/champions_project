import '../orm_models/ability.dart';
import '../orm_models/skin.dart';

class ChampionDetails {
  int championId;
  String name;
  String title;
  int roleId;
  String roleName;
  String rolePictureUrl;

  List<Ability> abilities;
  List<Skin> skins;
}