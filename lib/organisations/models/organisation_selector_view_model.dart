import 'package:abstractions/beliefs.dart';

import 'organisation_model.dart';

class OrganisationSelectorViewModel implements Belief {
  const OrganisationSelectorViewModel({
    this.selected,
    required this.all,
  });

  final OrganisationModel? selected;
  final Set<OrganisationModel> all;

  static OrganisationSelectorViewModel get initial =>
      const OrganisationSelectorViewModel(all: <OrganisationModel>{});

  @override
  OrganisationSelectorViewModel copyWith({
    OrganisationModel? selected,
    Set<OrganisationModel>? all,
  }) =>
      OrganisationSelectorViewModel(
        selected: selected ?? this.selected,
        all: all ?? this.all,
      );

  OrganisationSelectorViewModel copyWithDeselect({
    Set<OrganisationModel>? all,
  }) =>
      OrganisationSelectorViewModel(
        selected: null,
        all: all ?? this.all,
      );

  @override
  toJson() => {
        'selected': selected?.toJson(),
        'all': all.map((OrganisationModel e) => e.toJson).toList(),
      };
}
