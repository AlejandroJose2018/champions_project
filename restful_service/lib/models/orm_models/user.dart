import '../../aqueduct_app.dart';
import 'review.dart';

@Table(name: "user")
class _User {
  @Column(primaryKey: true) int id;
  String name;
  String avatar;

  @Relate(#abilities, onDelete: DeleteRule.cascade, isRequired: true)
  Review review;
  ManagedSet<Review> reviews;
}

class User extends ManagedObject<_User> implements _User {}