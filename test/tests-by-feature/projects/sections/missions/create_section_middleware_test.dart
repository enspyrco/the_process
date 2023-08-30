import 'package:test_utils_for_perception/test_utils_for_perception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/sections/missions/create_section.dart';
import 'package:the_process/sections/missions/update_sections_v_m.dart';
import 'package:types_for_auth/types_for_auth.dart';

void main() {
  group('CreateSection', () {
    test('dispatches UpdateSectionsVM and calls DatabaseServce.createSection',
        () async {
      var initialState = AppState.initial;

      var state = initialState.copyWith(
        auth: initialState.auth.copyWith(
            user: UserAuthStateTestDouble(signedIn: SignedInState.checking)),
        sections: initialState.sections.copyWith(newName: 'testy'),
      );

      var beliefSystem = RecordingBeliefSystem<AppState>(state: state);

      const mission = CreateSection();
      await mission.consider(beliefSystem);

      expect(
          beliefSystem
              .recorded(const UpdateSectionsVM(creatingNewSection: true)),
          true);
    });
  },
      skip:
          true); // until we fix CreateSection to use the database rather than a CloudRun instance
}
