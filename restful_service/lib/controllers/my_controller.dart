import 'package:aqueduct/aqueduct.dart';

class MyController extends ResourceController {
  final List<String> things = ['thing1', 'thing2'];

  @Operation.get()
  Future<Response> getThings() async {
    return Response.ok(things);
  }

  @Operation.get('id')
  Future<Response> getThing(@Bind.path('id') int id) async {
    if (id < 0 || id >= things.length) {
      return Response.notFound();
    }
    return Response.ok(things[id]);
  }
}