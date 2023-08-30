import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';

class UpdateOrganisationsPage extends Conclusion<AppState> {
  UpdateOrganisationsPage({this.creating, this.deleting});

  final bool? creating;
  final bool? deleting;

  @override
  AppState conclude(AppState state) {
    final nextCreating = creating ?? state.organisations.creator.creating;
    final nextDeleting = deleting ?? state.organisations.deleting;

    return state.copyWith(
        organisations: state.organisations.copyWith(
            creator:
                state.organisations.creator.copyWith(creating: nextCreating),
            deleting: nextDeleting));
  }

  @override
  toJson() => {
        'name_': 'UpdateOrganisationsPage',
        'state_': {'creating': creating, 'deleting': deleting}
      };
}
