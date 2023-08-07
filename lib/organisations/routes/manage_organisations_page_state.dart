import 'package:types_for_perception/beliefs.dart';
import 'package:types_for_perception/navigation_types.dart';

class ManageOrganisationsPageState<T extends CoreBeliefs>
    implements PageState, Belief {
  const ManageOrganisationsPageState();

  @override
  ManageOrganisationsPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ManageOrganisationsPageState'};
}
