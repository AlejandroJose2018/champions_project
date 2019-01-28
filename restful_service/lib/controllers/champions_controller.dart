import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct_app/models/orm_models/champion.dart';
import '../services/champions_service.dart';

class ChampionsController extends ResourceController { 
  final ChampionsService championsService = ChampionsService();

  @Operation.get()
  Future<Response> getAllChampions() async {
    final object = championsService.getChampions();
    final map = object.asStream();
    final response = Response.ok(map);
    return response;
  }

  @Operation.get('id')
  Future<Response> getChampion(@Bind.path('id') int id) async {
    final Champion champion = await championsService.getChampion(id);
    return Response.ok(champion.asMap());
  }
}