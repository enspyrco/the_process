import 'package:json_utils/json_utils.dart';
import 'package:abstractions/beliefs.dart';

import 'organisation_creator_view_model.dart';
import 'organisation_selector_view_model.dart';

class OrganisationsState implements Belief {
  const OrganisationsState({
    required this.creator,
    required this.selector,
    required this.deleting,
  });

  final OrganisationCreatorViewModel creator;
  final OrganisationSelectorViewModel selector;
  final bool deleting;

  static OrganisationsState get initial => OrganisationsState(
      creator: const OrganisationCreatorViewModel(),
      selector: OrganisationSelectorViewModel.initial,
      deleting: false);

  @override
  OrganisationsState copyWith({
    OrganisationCreatorViewModel? creator,
    OrganisationSelectorViewModel? selector,
    bool? deleting,
  }) =>
      OrganisationsState(
        creator: creator ?? this.creator,
        selector: selector ?? this.selector,
        deleting: deleting ?? this.deleting,
      );

  @override
  JsonMap toJson() => {
        'creator': creator.toJson(),
        'selector': selector.toJson(),
        'deleting': deleting,
      };
}
