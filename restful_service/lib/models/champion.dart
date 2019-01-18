import 'ability.dart';
import 'role.dart';
import 'skin.dart';

class Champion {
  Champion();

  Champion.fromSimple(int championId, String name, String title, String bannerPicturePath) {
    _championId = championId;
    _name = name;
    _title = title;
    _bannerPicturePath = bannerPicturePath;
  }

  Champion.fromDetailed(int championId, String name, String title, String description, String avatarPicturePath, String splashPicturePath){
    _championId = championId;
    _name = name;
    _title = title;
    _description = description;
    _avatarPicturePath = avatarPicturePath;
    _splashPicturePath = splashPicturePath;
  }

  int _championId;
  String _name;
  String _title;
  String _description;
  String _avatarPicturePath;
  String _bannerPicturePath;
  String _splashPicturePath;

  Role _role;
  List<Skin> _skins;
  List<Ability> _abilities;
}