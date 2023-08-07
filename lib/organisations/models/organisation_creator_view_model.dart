import 'package:json_utils/json_utils.dart';
import 'package:types_for_perception/beliefs.dart';

class OrganisationCreatorViewModel implements Belief {
  const OrganisationCreatorViewModel({
    this.name = '',
    this.creating = false,
  });

  /// The organisaiton name
  final String name;

  /// Are we currently creating a new organisation?
  final bool creating;

  @override
  OrganisationCreatorViewModel copyWith({
    String? name,
    bool? creating,
  }) =>
      OrganisationCreatorViewModel(
        creating: creating ?? this.creating,
        name: name ?? this.name,
      );

  @override
  JsonMap toJson() => {
        'creating': creating,
        'name': name,
      };
}
