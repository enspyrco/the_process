import 'package:abstractions/beliefs.dart';
import 'package:abstractions/framing.dart';

class ProjectDetailsPageState<T extends CoreBeliefs>
    implements FramingLayer, Belief {
  const ProjectDetailsPageState();

  @override
  ProjectDetailsPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ProjectDetailsPageState'};
}
