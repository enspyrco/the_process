import 'dart:async';

import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';
import '../../projects/models/section_model.dart';
import 'set_sections.dart';

StreamSubscription<List<Document>>? _subscription;

class TapSections extends Consideration<AppBeliefs> {
  const TapSections({bool turnOff = false}) : _turnOff = turnOff;

  final bool _turnOff;

  @override
  Future<void> consider(BeliefSystem<AppBeliefs> beliefSystem) async {
    _subscription?.cancel();
    if (_turnOff) return;

    var service = locate<FirestoreService>();

    // Convert json from the database to an action that handles the data,
    // storing in the app state.
    _subscription =
        service.tapIntoCollection(at: 'projects/the-process/sections').listen(
      (documents) {
        beliefSystem.conclude(SetSections(
            list: documents
                .map((document) => SectionModel.fromJson(document.fields))
                .toList()));
      },
      onError: (Object error, StackTrace trace) => beliefSystem.conclude(
        CreateFeedback(error, trace),
      ),
    );
  }

  @override
  toJson() => {
        'name_': 'TapSections',
        'state_': {'turnOff': _turnOff},
      };
}
