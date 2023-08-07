import 'package:json_utils/json_utils.dart';
import 'package:types_for_perception/beliefs.dart';

import 'project_state.dart';

class ProjectsState implements Belief {
  const ProjectsState({
    required this.all,
    required this.creating,
  });

  final Set<ProjectState> all;
  final bool creating;

  static ProjectsState get initial =>
      const ProjectsState(all: <ProjectState>{}, creating: false);

  @override
  ProjectsState copyWith({Set<ProjectState>? all, bool? creating}) =>
      ProjectsState(
        all: all ?? this.all,
        creating: creating ?? this.creating,
      );

  @override
  JsonMap toJson() => {
        'all': all.map((e) => e.toJson()).toList(),
        'creating': creating,
      };
}
