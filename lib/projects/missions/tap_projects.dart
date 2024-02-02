import 'dart:async';

import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';
import '../models/project_state.dart';
import 'set_projects.dart';

StreamSubscription<List<Document>>? _subscription;

class TapProjects extends Consideration<AppBeliefs> {
  const TapProjects({required String? organisationId, bool turnOff = false})
      : _organisationId = organisationId,
        _turnOff = turnOff;

  final String? _organisationId;
  final bool _turnOff;

  @override
  Future<void> consider(BeliefSystem<AppBeliefs> beliefSystem) async {
    await _subscription?.cancel();
    if (_turnOff) return;

    // tap the database at the appropriate location...
    var service = locate<FirestoreService>();
    final changes = service.tapIntoCollection(
        at: 'projects/the-process/projects',
        where: 'organisationIds',
        arrayContains: _organisationId);

    // ... and direct the stream to the store.
    _subscription = changes.listen(
      (documents) {
        var models = documents
            .map<ProjectState>(
                (document) => ProjectState.fromDocument(document))
            .toSet();
        beliefSystem.conclude(SetProjects(models));
      },
      onError: (Object error, StackTrace trace) => CreateFeedback(error, trace),
    );
  }

  @override
  toJson() => {
        'name_': 'TapProjects',
        'state_': {
          'organisationId': _organisationId,
          'turnOff': _turnOff,
        },
      };
}
