import 'package:flutterfire_firebase_auth_for_perception/flutterfire_firebase_auth_for_perception.dart';
import 'package:flutterfire_firestore_service/flutterfire_firestore_service.dart';
import 'package:percepts/percepts.dart';
import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:introspection/introspection.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:abstractions/beliefs.dart';

import 'app_beliefs.dart';
import '../firebase_options.dart';
import '../home/home_screen.dart';
import '../organisations/routes/manage_organisations_page_state.dart';
import '../organisations/routes/manage_organisations_screen.dart';
import '../projects/routes/project_details/project_details_page_state.dart';
import '../projects/routes/project_details/project_details_screen.dart';

Future<void> setupPriors() async {
  /// Setup FlutterFire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Setup Locator so plugins can add SystemChecks & Routes, configure the AppState, etc.
  Locator.add<Habits>(DefaultHabits());
  Locator.add<PageGenerator>(DefaultPageGenerator());
  Locator.add<AppBeliefs>(AppBeliefs.initial);

  /// Perform any final initialization by the app such as setting up routes.
  initializeTheProcess();

  /// Finally, create our BeliefSystem and add to the Locator.
  Locator.add<BeliefSystem<AppBeliefs>>(DefaultBeliefSystem<AppBeliefs>(
      beliefs: locate<AppBeliefs>(),
      errorHandlers: DefaultErrorHandlers<AppBeliefs>(),
      habits: locate<Habits>(),
      beliefSystemFactory: ParentingBeliefSystem.new));
}

void initializeTheProcess() {
  /// Perform individual plugin initialization.
  initializeErrorHandling<AppBeliefs>();
  initializeIdentity<AppBeliefs>(initialScreen: const HomeScreen());
  initializeIntrospection<AppBeliefs>();
  initializeFraming<AppBeliefs>();

  /// Add services used in away missions.
  Locator.add<FirestoreService>(FlutterfireFirestoreService());

  /// Add page generators for [ManageOrganisations] & [ProjectDetails].
  /// The page generators are applied when a PageState is found in
  /// [AppState.navigation.stack], turning a PageState into a Page, which
  /// the Navigator turns into a Route, that includes the Screen we use when
  /// composing the PageState (see examples below).
  final generator = locate<PageGenerator>();
  generator.add(
    type: ManageOrganisationsPageState,
    generator: (state) => MaterialPage(
      key: const ValueKey(ManageOrganisationsPageState),
      child: ManageOrganisationsScreen(state as ManageOrganisationsPageState),
    ),
  );
  generator.add(
    type: ProjectDetailsPageState,
    generator: (state) => MaterialPage(
      key: const ValueKey(ProjectDetailsPageState),
      child: ProjectDetailsScreen(state as ProjectDetailsPageState),
    ),
  );
}

class OriginOPerception extends StatelessWidget {
  const OriginOPerception({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (const bool.fromEnvironment('IN-APP-INTROSPECTION'))
          Expanded(
            flex: 1,
            child: Material(
              child: IntrospectionScreen(locate<IntrospectionHabit>().stream),
            ),
          ),
        Expanded(
          flex: 1,
          child: FramingBuilder<AppBeliefs>(
            onInit: (beliefSystem) => beliefSystem.consider(
              const ObservingIdentity<AppBeliefs,
                  FlutterfireFirebaseAuthSubsystem>(),
            ),
          ),
        ),
      ],
    );
  }
}
