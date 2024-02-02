import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';

class UpdateSectionsVM extends Conclusion<AppBeliefs> {
  const UpdateSectionsVM({required bool creatingNewSection})
      : _creatingNewSection = creatingNewSection;

  final bool _creatingNewSection;

  @override
  AppBeliefs conclude(AppBeliefs state) {
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
