import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';

class UpdateProjectsView extends Conclusion<AppBeliefs> {
  const UpdateProjectsView({bool? creating}) : _creating = creating;

  final bool? _creating;

  @override
  AppBeliefs conclude(AppBeliefs state) {
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
