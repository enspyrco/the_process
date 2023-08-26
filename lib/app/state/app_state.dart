import 'package:auth_for_perception/auth_for_perception.dart';
import 'package:error_handling_for_perception/error_handling_for_perception.dart';
import 'package:navigation_for_perception/navigation_for_perception.dart';
import 'package:types_for_perception/auth_beliefs.dart';
import 'package:types_for_perception/beliefs.dart';
import 'package:types_for_perception/error_handling_types.dart';
import 'package:types_for_perception/navigation_types.dart';

import '../../organisations/models/organisations_state.dart';
import '../../projects/models/projects_state.dart';
import '../../projects/models/sections_state.dart';

class AppState
    implements
        CoreBeliefs,
        AppStateNavigation,
        AppStateErrorHandling,
        AuthConcept {
  AppState({
    required this.auth,
    required this.error,
    required this.navigation,
    required this.organisations,
    required this.projects,
    required this.sections,
  });

  @override
  final AuthBeliefs auth;
  @override
  final DefaultErrorHandlingState error;
  @override
  final DefaultNavigationState navigation;

  OrganisationsState organisations;
  ProjectsState projects;
  SectionsState sections;

  static AppState get initial => AppState(
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
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    AuthBeliefs? auth,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error,
        organisations: organisations ?? this.organisations,
        projects: projects ?? this.projects,
        sections: sections ?? this.sections,
      );

  @override
  toJson() => {
        'navigation': navigation.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
        'organisations': organisations.toJson(),
        'projects': projects.toJson(),
        'sections': sections.toJson(),
      };
}
