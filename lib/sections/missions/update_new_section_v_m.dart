import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';

class UpdateNewSectionVM extends Conclusion<AppBeliefs> {
  const UpdateNewSectionVM({String? name}) : _name = name;

  final String? _name;

  @override
  AppBeliefs conclude(AppBeliefs state) {
    var newSections =
        state.sections.copyWith(newName: _name ?? state.sections.newName);
    return state.copyWith(sections: newSections);
  }

  @override
  toJson() => {
        'name_': 'UpdateNewSectionVM',
        'state_': {'name': _name}
      };
}
