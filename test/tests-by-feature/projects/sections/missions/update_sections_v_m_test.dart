import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/app_beliefs.dart';
import 'package:the_process/sections/missions/update_sections_v_m.dart';

void main() {
  group('UpdateSectionsVMReducer', () {
    test('correctly updates creatingNewSection flag', () {
      // Setup app state and check expected values
      final initialState = AppBeliefs.initial;
      expect(initialState.sections.creatingNewSection, false);

      const mission = UpdateSectionsVM(creatingNewSection: true);

      final newState = mission.conclude(initialState);

      expect(newState.sections.creatingNewSection, true);
    });
  });
}
