import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';
import '../models/organisation_model.dart';

class SetSelectedOrganisation extends Conclusion<AppBeliefs> {
  SetSelectedOrganisation(this.organisation);

  final OrganisationModel? organisation;

  @override
  AppBeliefs conclude(AppBeliefs state) {
    var newSelector = (organisation == null)
        ? state.organisations.selector.copyWithDeselect()
        : state.organisations.selector.copyWith(selected: organisation);
    var newOrganisations = state.organisations.copyWith(selector: newSelector);
    return state.copyWith(organisations: newOrganisations);
  }

  @override
  toJson() => {
        'name_': 'SetSelectedOrganisation',
        'state_': <String, dynamic>{'organisation': organisation?.toJson()}
      };
}
