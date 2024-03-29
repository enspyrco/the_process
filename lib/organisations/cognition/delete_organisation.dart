import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';
import 'update_organisations_page.dart';

class DeleteOrganisation extends Consideration<AppBeliefs> {
  @override
  Future<void> consider(BeliefSystem<AppBeliefs> beliefSystem) async {
    try {
      beliefSystem.conclude(UpdateOrganisationsPage(deleting: true));

      var selected = beliefSystem.beliefs.organisations.selector.selected;
      if (selected == null) return;

      var service = locate<FirestoreService>();

      await service.deleteDocument(
          at: 'projects/the-process/organisations/${selected.id}');
    } catch (error) {
      rethrow;
    } finally {
      beliefSystem.conclude(UpdateOrganisationsPage(deleting: false));
    }
  }

  @override
  toJson() => {'name_': 'DeleteOrganisation', 'state_': <String, dynamic>{}};
}
