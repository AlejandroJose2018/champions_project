import '../models/orm_models/champion.dart';
import '../utils/db_helper.dart';

class ChampionsService {
  ChampionsService() {
    dbHelper = DbHelper();
  }

  DbHelper dbHelper;
  
  Future<List<Champion>> getChampions() async {

    List<Champion> champions = List();
    return champions;
  }
  
  Future<Champion> getChampion(int id) async {
    Champion champion = Champion();
    return champion;
  }
}
