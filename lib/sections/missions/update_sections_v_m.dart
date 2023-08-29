import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';

class UpdateSectionsVM extends Conclusion<AppState> {
  const UpdateSectionsVM({required bool creatingNewSection})
      : _creatingNewSection = creatingNewSection;

  final bool _creatingNewSection;

  @override
  AppState update(AppState state) {
    var newSections =
        state.sections.copyWith(creatingNewSection: _creatingNewSection);
    return state.copyWith(sections: newSections);
  }

  @override
  toJson() => {
        'name_': 'UpdateSectionsVM',
        'state_': {'creatingNewSection': _creatingNewSection}
      };
}
