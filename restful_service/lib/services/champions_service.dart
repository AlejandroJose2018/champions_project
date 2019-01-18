import 'package:sqljocky5/sqljocky.dart';
import '../models/champion.dart';
import '../utils/db_helper.dart';

class ChampionsService {
  ChampionsService() {
    dbHelper = DbHelper();
  }

  DbHelper dbHelper;
  
  Future<List<Champion>> getChampions() async {
    final Results results = await dbHelper.runRawQuery("SELECT * FROM CHAMPION");
    final List<Champion> champions = List(results.length);
    results.forEach((Row row) {
      champions.add(
        Champion.fromSimple(
          int.parse(row.byName("championId").toString()),
          row.byName("name").toString(),
          row.byName("title").toString(),
          row.byName("bannerPicturePath").toString()
        )
      );
    });
    return champions;
  }
  
  Future<Champion> getChampion(int id) async {
    final Results results = await dbHelper.runRawQuery("SELECT * FROM CHAMPION WHERE CHAMPION.ID = '$id'");
    return Champion.fromSimple(
      int.parse(results.first.byName("championId").toString()),
      results.first.byName("name").toString(),
      results.first.byName("title").toString(),
      results.first.byName("bannerPicturePath").toString()
    );
  }
}