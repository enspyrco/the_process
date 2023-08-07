import 'package:auth_for_perception/auth_for_perception.dart';
import 'package:error_handling_for_perception/error_handling_for_perception.dart';
import 'package:navigation_for_perception/navigation_for_perception.dart';
import 'package:types_for_perception/auth_beliefs.dart';
import 'package:types_for_perception/beliefs.dart';
import 'package:types_for_perception/perception_annotations.dart';
import 'package:types_for_perception/error_handling_types.dart';
import 'package:types_for_perception/navigation_types.dart';

import '../../organisations/models/organisations_state.dart';
import '../../projects/models/projects_state.dart';
import '../../projects/models/sections_state.dart';

part 'app_state.g.dart';

@GeneratedImplementation()
abstract class AppState
    implements
        CoreBeliefs,
        AppStateNavigation,
        AppStateErrorHandling,
        AuthConcept {
  OrganisationsState get organisations;
  ProjectsState get projects;
  SectionsState get sections;

  factory AppState.initialValue() => GeneratedAppState(
        projects: ProjectsState.initial,
        sections: SectionsState.initial,
        organisations: OrganisationsState.initial,
        navigation: DefaultNavigationState.initial,
        auth: AuthBeliefSystem.initialBeliefs(),
        error: DefaultErrorHandlingState.initial,
      );

  @override
  AppState copyWith({
    OrganisationsState? organisations,
    ProjectsState? projects,
    SectionsState? sections,
    NavigationState? navigation,
    ErrorHandlingState? error,
    AuthBeliefs? auth,
  });
}
