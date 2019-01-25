import '../../aqueduct_app.dart';
import 'champion.dart';
import 'user.dart';

@Table(name: "review")
class _Review {
  @Column(primaryKey: true) int id;
  String comment;
  bool feeling;

  @Relate(#reviews, onDelete: DeleteRule.cascade) User user;
  @Relate(#reviews, onDelete: DeleteRule.cascade, isRequired: true) Champion champion;
}

class Review extends ManagedObject<_Review> implements _Review {}