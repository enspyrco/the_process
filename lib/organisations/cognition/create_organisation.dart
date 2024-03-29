import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';
import '../models/organisation_model.dart';
import 'update_organisations_page.dart';

class CreateOrganisation extends Consideration<AppBeliefs> {
  CreateOrganisation(OrganisationModel organisation)
      : _organisation = organisation;

  final OrganisationModel _organisation;

  @override
  Future<void> consider(BeliefSystem<AppBeliefs> beliefSystem) async {
    beliefSystem.conclude(UpdateOrganisationsPage(creating: true));

    var organisation = _organisation
        .copyWith(ownerIds: {beliefSystem.beliefs.identity.userAuthState.uid!});

    var service = locate<FirestoreService>();

    try {
      await service.createDocument(
          at: 'projects/the-process/organisations',
          from: organisation.toJson());
    } catch (error) {
      rethrow;
    } finally {
      beliefSystem.conclude(UpdateOrganisationsPage(creating: false));
    }
  }

  @override
  toJson() => {'name_': 'CreateOrganisation', 'state_': _organisation.toJson()};
}
