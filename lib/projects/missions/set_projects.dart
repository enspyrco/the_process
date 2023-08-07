import 'package:types_for_perception/beliefs.dart';

import '../../app/state/app_state.dart';
import '../models/project_state.dart';

class SetProjects extends LandingMission<AppState> {
  const SetProjects(Set<ProjectState> projects) : _projects = projects;

  final Set<ProjectState> _projects;

  @override
  AppState landingInstructions(AppState state) {
    var newProjects = state.projects.copyWith(all: _projects);
    return state.copyWith(projects: newProjects);
  }

  @override
  toJson() => {
        'name_': 'SetProjects',
        'state_': {
          'projects': [for (var project in _projects) project.toJson()]
        },
      };
}
