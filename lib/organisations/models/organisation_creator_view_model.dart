import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

class OrganisationCreatorViewModel implements AstroState {
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