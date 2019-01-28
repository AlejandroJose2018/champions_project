import 'dart:io';
import 'package:aqueduct/aqueduct.dart';

class MyController extends ResourceController {
  final List<String> things = ['nick', 'jeremy', 'ajay', 'khevna', 'jin', 'sreekanth', 'jose'];

  @Operation.get()
  Future<Response> getThings() async {
    return Response.ok(things)..contentType = ContentType.json;
  }

  @Operation.get('id')
  Future<Response> getThing(@Bind.path('id') int id) async {
    if (id < 0 || id >= things.length) {
      return Response.notFound();
    }
    return Response.ok(things[id])..contentType = ContentType.json;
  }
}