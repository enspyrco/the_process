import 'package:redux/redux.dart';
import 'package:the_process/middleware/app/plumb_streams.dart';
import 'package:the_process/middleware/auth/observe_auth_state.dart';
import 'package:the_process/middleware/auth/sign_in_with_apple.dart';
import 'package:the_process/middleware/auth/sign_in_with_google.dart';
import 'package:the_process/middleware/auth/sign_out.dart';
import 'package:the_process/middleware/platform/detect_platform.dart';
import 'package:the_process/middleware/platform/launch_u_r_l.dart';
import 'package:the_process/middleware/profile/disregard_profile_data.dart';
import 'package:the_process/middleware/profile/get_authorized.dart';
import 'package:the_process/middleware/profile/observe_profile_data.dart';
import 'package:the_process/middleware/sections/create_section.dart';
import 'package:the_process/middleware/shared/connect_database.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/http_service.dart';
import 'package:the_process/services/platform_service.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createAppMiddleware({
  required AuthService authService,
  required DatabaseService databaseService,
  required PlatformService platformService,
  required HttpService httpService,
}) {
  return [
    // Auth
    ObserveAuthStateMiddleware(authService),
    PlumbStreamsMiddleware(authService, databaseService),
    SignInWithAppleMiddleware(authService),
    SignInWithGoogleMiddleware(authService, databaseService),
    SignOutMiddleware(authService),
    // Platform
    DetectPlatformMiddleware(platformService),
    LaunchURLMiddleware(platformService),
    // Profile
    DisregardProfileDataMiddleware(databaseService),
    GetAuthorizedMiddleware(databaseService, platformService),
    ObserveProfileDataMiddleware(databaseService),
    // Sections
    CreateSectionMiddleware(httpService),
    // Shared
    ConnectDatabaseMiddleware(databaseService),
  ];
}
