import 'package:identity_in_perception/identity_in_perception.dart';
import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';
import 'package:abstractions/error_correction.dart';
import 'package:abstractions/framing.dart';

import '../../organisations/models/organisations_state.dart';
import '../../projects/models/projects_state.dart';
import '../../projects/models/sections_state.dart';

class AppState
    implements
        CoreBeliefs,
        FramingConcept,
        ErrorCorrectionConcept,
        IdentityConcept {
  AppState({
    required this.auth,
    required this.error,
    required this.framing,
    required this.organisations,
    required this.projects,
    required this.sections,
  });

  @override
  final IdentityBeliefs auth;
  @override
  final DefaultErrorCorrectionBeliefs error;
  @override
  final DefaultFramingBeliefs framing;

  OrganisationsState organisations;
  ProjectsState projects;
  SectionsState sections;

  static AppState get initial => AppState(
        projects: ProjectsState.initial,
        sections: SectionsState.initial,
        organisations: OrganisationsState.initial,
        framing: DefaultFramingBeliefs.initial,
        auth: AuthBeliefSystem.initialBeliefs(),
        error: DefaultErrorCorrectionBeliefs.initial,
      );

  @override
  AppState copyWith({
    OrganisationsState? organisations,
    ProjectsState? projects,
    SectionsState? sections,
    DefaultFramingBeliefs? framing,
    DefaultErrorCorrectionBeliefs? error,
    IdentityBeliefs? auth,
  }) =>
      AppState(
        framing: framing ?? this.framing,
        auth: auth ?? this.auth,
        error: error ?? this.error,
        organisations: organisations ?? this.organisations,
        projects: projects ?? this.projects,
        sections: sections ?? this.sections,
      );

  @override
  toJson() => {
        'navigation': framing.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
        'organisations': organisations.toJson(),
        'projects': projects.toJson(),
        'sections': sections.toJson(),
      };
}
