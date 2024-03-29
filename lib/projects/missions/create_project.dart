import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';
import '../../organisations/models/organisation_model.dart';
import '../models/project_state.dart';
import '../models/update_projects_view.dart';

class CreateProject extends Consideration<AppBeliefs> {
  const CreateProject(ProjectState project) : _project = project;

  final ProjectState _project;

  @override
  Future<void> consider(BeliefSystem<AppBeliefs> beliefSystem) async {
    try {
      OrganisationModel? selected =
          beliefSystem.beliefs.organisations.selector.selected;
      if (selected == null) return;

      String uid = beliefSystem.beliefs.identity.userAuthState.uid!;

      ProjectState project =
          _project.copyWith(ownerIds: {uid}, organisationIds: {selected.id});

      var service = locate<FirestoreService>();

      await service.createDocument(
          at: 'projects/the-process/projects', from: project.toJson());
    } catch (error) {
      rethrow;
    } finally {
      beliefSystem.conclude(const UpdateProjectsView(creating: false));
    }
  }

  @override
  toJson() => {
        'name_': 'CreateProject',
        'state_': _project.toJson(),
      };
}
