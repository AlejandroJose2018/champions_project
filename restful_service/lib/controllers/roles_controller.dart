import 'dart:convert';
import 'package:aqueduct/aqueduct.dart';
import '../models/role.dart';
import 'package:sqljocky5/sqljocky.dart';

class RolesController extends ResourceController {

  @Operation.get()
  Future<Response> getAllRoles() async {
    List<Role> roles = List();

    Role assassinRole = Role();
    assassinRole.roleId = 1;
    assassinRole.name = 'Assassin';

    roles.add(assassinRole);

    Role casterRole = Role();
    casterRole.roleId = 2;
    casterRole.name = 'Caster';

    roles.add(casterRole);

    print('trying to get all roles');

    String jsonResult = jsonEncode(roles);
    print(jsonResult);

    return Response.ok(jsonEncode(roles[0]));
  } 

  @Operation.get('id')
  Future<Response> getProjectById(@Bind.path('id') int id) async {
    print('sup doc');
    return Response.ok("You are looking for the role with the id: $id");
  }
}