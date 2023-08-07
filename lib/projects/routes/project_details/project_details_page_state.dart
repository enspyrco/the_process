import 'package:types_for_perception/beliefs.dart';
import 'package:types_for_perception/navigation_types.dart';

class ProjectDetailsPageState<T extends CoreBeliefs>
    implements PageState, Belief {
  const ProjectDetailsPageState();

  @override
  ProjectDetailsPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ProjectDetailsPageState'};
}
