import '../aqueduct_app.dart';
import '../models/orm_models/champion.dart';
import '../utils/db_helper.dart';

class ChampionsService {
  ChampionsService() {
    dbHelper = DbHelper();
  }

  DbHelper dbHelper;
  
  Future<List<Champion>> getChampions() async {
    final query = Query<Champion>(dbHelper.getManagedContext())
      ..join(set: (ab) => ab.abilities)
      ..join(object: (ro) => ro.role)
      ..join(set: (re) => re.reviews)
      ..join(set: (sk) => sk.skins);
    final championsResult = await query.fetch();

    //test later
    final testRole = championsResult[1].role;
    return championsResult;
  }
  
  Future<Champion> getChampion(int id) async {
    final query = Query<Champion>(dbHelper.getManagedContext())
      ..where((ch) => ch.id)
      ..join(set: (ab) => ab.abilities)
      ..join(object: (ro) => ro.role)
      ..join(set: (re) => re.reviews)
      ..join(set: (sk) => sk.skins);

    final championsResult = await query.fetch();
    return championsResult[0];
  }

  void something() {
    final object = Champion();
    final map = object.asMap();
  }
}