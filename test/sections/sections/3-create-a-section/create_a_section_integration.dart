import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/store_auth_step_action.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/enums/platform/platform_enum.dart';
import 'package:the_process/middleware/app_middleware.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/reducers/app_reducer.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/http_service.dart';
import 'package:the_process/widgets/app_widget/initializing_error_page.dart';
import 'package:the_process/widgets/app_widget/initializing_indicator.dart';
import 'package:the_process/widgets/auth/auth_page_buttons/apple_sign_in_button.dart';
import 'package:the_process/widgets/sections/new_section_item.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

import '../../../mocks/firebase/firebase_auth_fake.dart';
import '../../../mocks/firebase/firebase_firestore_fake.dart';
import '../../../mocks/http/fake_client.dart';
import '../../../mocks/services/platform_service_mock.dart';
import '../../../utils/testing/app_widget_harness.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  testWidgets('create a section', (WidgetTester tester) async {
    // Create auth & database objects we can later use to emit various events
    final fakeAuth = FirebaseAuthFake();
    final fakeDatabase = FirebaseFirestoreFake();
    final fakeClient = FakeHttpClient();
    // Create the services using the previous objects
    final authService = AuthService(auth: fakeAuth);
    final databaseService = DatabaseService(database: fakeDatabase);
    final httpService = HttpService(client: fakeClient);
    // We just need the platform service to return a platform so we use a mock.
    final mockPlatformService = PlatformServiceMock();
    when(mockPlatformService.detectPlatform()).thenReturn(PlatformEnum.iOS);

    final store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: [
        ...createAppMiddleware(
            authService: authService,
            databaseService: databaseService,
            platformService: mockPlatformService,
            httpService: httpService),
      ],
    );
    final harness = AppWidgetHarness(store: store);

    runApp(harness.widget);

    // Trace the timeline of the following operation. The timeline result will
    // be written to `build/integration_response_data.json` with the key
    // `timeline`.
    await binding.traceAction(() async {
      await tester.pump();

      final initializingIndicatorFinder = find.byType(InitializingIndicator);

      expect(initializingIndicatorFinder, findsOneWidget);

      await tester.pump();

      expect(initializingIndicatorFinder, findsNothing);

      expect(find.byType(InitializingErrorPage), findsNothing);

      expect(find.byType(WaitingIndicator), findsOneWidget);

      store.dispatch(StoreAuthStepAction(step: AuthStep.waitingForInput));

      await tester.pump();

      expect(find.byType(WaitingIndicator), findsNothing);

      expect(find.byType(AppleSignInButton), findsOneWidget);

      // simulate the state for an authenticated user being emitted
      fakeAuth.emitUser();

      await tester.pump();

      expect(find.byType(NewSectionItem), findsOneWidget);

      final textField = find.byType(TextFormField);
      expect(textField, findsOneWidget);
      await tester.enterText(textField, 'testy');

      expect(find.byType(WaitingIndicator), findsNothing);

      final submitButton = find.byType(MaterialButton);
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);

      await tester.pump();

      expect(find.byType(WaitingIndicator), findsOneWidget);
      expect(find.byType(TextFormField), findsNothing);
      expect(find.byType(MaterialButton), findsNothing);

      fakeDatabase.emitSectionsSnapshot();

      await tester.pump();

      expect(find.byType(WaitingIndicator), findsNothing);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(MaterialButton), findsOneWidget);
    });
  });
}
