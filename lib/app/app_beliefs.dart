import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';
import 'package:abstractions/error_correction.dart';
import 'package:abstractions/framing.dart';
import 'package:percepts/percepts.dart';

import '../organisations/models/organisations_state.dart';
import '../projects/models/projects_state.dart';
import '../projects/models/sections_state.dart';

class AppBeliefs
    implements
        CoreBeliefs,
        FramingConcept,
        ErrorCorrectionConcept,
        IdentityConcept {
  AppBeliefs({
    required this.identity,
    required this.error,
    required this.framing,
    required this.organisations,
    required this.projects,
    required this.sections,
  });

  @override
  final DefaultIdentityBeliefs identity;
  @override
  final DefaultErrorCorrectionBeliefs error;
  @override
  final DefaultFramingBeliefs framing;

  OrganisationsState organisations;
  ProjectsState projects;
  SectionsState sections;

  static AppBeliefs get initial => AppBeliefs(
        projects: ProjectsState.initial,
        sections: SectionsState.initial,
        organisations: OrganisationsState.initial,
        framing: DefaultFramingBeliefs.initial,
        identity: DefaultIdentityBeliefs.initial,
        error: DefaultErrorCorrectionBeliefs.initial,
      );

  @override
  AppBeliefs copyWith({
    OrganisationsState? organisations,
    ProjectsState? projects,
    SectionsState? sections,
    DefaultFramingBeliefs? framing,
    DefaultErrorCorrectionBeliefs? error,
    DefaultIdentityBeliefs? identity,
  }) =>
      AppBeliefs(
        framing: framing ?? this.framing,
        identity: identity ?? this.identity,
        error: error ?? this.error,
        organisations: organisations ?? this.organisations,
        projects: projects ?? this.projects,
        sections: sections ?? this.sections,
      );

  @override
  toJson() => {
        'navigation': framing.toJson(),
        'identity': identity.toJson(),
        'error': error.toJson(),
        'organisations': organisations.toJson(),
        'projects': projects.toJson(),
        'sections': sections.toJson(),
      };
}
