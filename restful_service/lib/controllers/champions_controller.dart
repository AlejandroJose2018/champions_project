import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct_app/models/orm_models/champion.dart';
import '../services/champions_service.dart';

class ChampionsController extends ResourceController { 
  final ChampionsService championsService = ChampionsService();

  @Operation.get()
  Future<List<Champion>> getAllChampions() async {
    return championsService.getChampions();
  }

  @Operation.get('id')
  Future<Champion> getChampion(@Bind.path('id') int id) async {
    return championsService.getChampion(id);
  }
}