import 'dart:async';

import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:collection/collection.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';
import '../../projects/missions/tap_projects.dart';
import '../models/organisation_model.dart';
import 'set_organisations.dart';
import 'set_selected_organisation.dart';

StreamSubscription<List<Document>>? _subscription;

class TapOrganisations extends Consideration<AppState> {
  TapOrganisations({bool turnOff = false}) : _turnOff = turnOff;

  final bool _turnOff;

  @override
  Future<void> consider(BeliefSystem<AppState> beliefSystem) async {
    await _subscription?.cancel();
    if (_turnOff) return;

    // Tap into the database at the appropriate location
    var service = locate<FirestoreService>();
    final organisationsChanges =
        service.tapIntoCollection(at: 'projects/the-process/organisations');

    // Direct the stream of changes to the store.
    _subscription = organisationsChanges.listen(
      (documents) {
        var organisations = documents
            .map<OrganisationModel>(
                (document) => OrganisationModel.fromDocument(document))
            .toSet();

        // Find any added organisatons.
        var added = organisations
            .difference(beliefSystem.beliefs.organisations.selector.all)
            .firstOrNull;
        // Find any removed organisatons.
        var removed = beliefSystem.beliefs.organisations.selector.all
            .difference(organisations)
            .firstOrNull;

        // If an organisation was removed, selected will be set to null.
        // If org was added, it gets set as the selected org.
        // Otherwise leave selected as it was.
        OrganisationModel? nextSelected;
        if (removed == null) {
          nextSelected =
              added ?? beliefSystem.beliefs.organisations.selector.selected;
        }

        beliefSystem.conclude(SetOrganisations(organisations));
        beliefSystem.conclude(SetSelectedOrganisation(nextSelected));
        beliefSystem.consider(TapProjects(organisationId: nextSelected?.id));
      },
      onError: (Object error, StackTrace trace) => beliefSystem.conclude(
        CreateErrorReport(error, trace),
      ),
    );
  }

  @override
  toJson() => {
        'name_': 'TapOrganisations',
        'state_': {'turnOff': _turnOff},
      };
}
