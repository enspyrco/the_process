import 'package:abstractions/beliefs.dart';
import 'package:abstractions/framing.dart';

class ManageOrganisationsPageState<T extends CoreBeliefs>
    implements FramingLayer, Belief {
  const ManageOrganisationsPageState();

  @override
  ManageOrganisationsPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ManageOrganisationsPageState'};
}
