import 'package:abstractions/beliefs.dart';

class TeamMember implements Belief {
  const TeamMember({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.photoURL,
  });

  final String uid;
  final String firstName;
  final String lastName;
  final String displayName;
  final String photoURL;

  @override
  Belief copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
