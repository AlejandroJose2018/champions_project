import 'dart:convert';
import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct_app/models/orm_models/role.dart';

class RolesController extends ResourceController {

  @Operation.get()
  Future<Response> getAllRoles() async {
    List<Role> roles = List();

    Role assassinRole = Role();
    assassinRole.id = 1;
    assassinRole.name = 'Assassin';

    roles.add(assassinRole);

    Role casterRole = Role();
    casterRole.id = 2;
    casterRole.name = 'Caster';

    roles.add(casterRole);

    return Response.ok(jsonEncode(roles[0]));
  } 

  @Operation.get('id')
  Future<Response> getProjectById(@Bind.path('id') int id) async {
    print('sup doc');
    return Response.ok("You are looking for the role with the id: $id");
  }
}