import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';
import '../models/organisation_model.dart';

class SetOrganisations extends Conclusion<AppState> {
  SetOrganisations(Set<OrganisationModel> organisations)
      : _organisations = organisations;

  final Set<OrganisationModel> _organisations;

  @override
  AppState conclude(AppState state) {
    var newSelector =
        state.organisations.selector.copyWith(all: _organisations);
    var newOrganisations = state.organisations.copyWith(selector: newSelector);
    return state.copyWith(organisations: newOrganisations);
  }

  @override
  toJson() => {
        'name_': 'SetOrganisations',
        'state_': {
          'organisations': [for (var org in _organisations) org.toJson()]
        }
      };
}
