import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';

class UpdateProjectsView extends Conclusion<AppState> {
  const UpdateProjectsView({bool? creating}) : _creating = creating;

  final bool? _creating;

  @override
  AppState update(AppState state) {
    final nextCreating = _creating ?? state.projects.creating;
    final newProjects = state.projects.copyWith(creating: nextCreating);
    return state.copyWith(projects: newProjects);
  }

  @override
  toJson() => {
        'name_': 'UpdateProjectsView',
        'state_': {'creating': _creating},
      };
}
