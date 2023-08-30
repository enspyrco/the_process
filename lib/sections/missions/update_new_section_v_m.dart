import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';

class UpdateNewSectionVM extends Conclusion<AppState> {
  const UpdateNewSectionVM({String? name}) : _name = name;

  final String? _name;

  @override
  AppState conclude(AppState state) {
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
