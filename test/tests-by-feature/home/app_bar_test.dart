import 'package:flutterfire_firebase_auth_for_perception/flutterfire_firebase_auth_for_perception.dart';
import 'package:test_utils_for_perception/test_utils_for_perception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/app_beliefs.dart';
import 'package:the_process/home/home_screen.dart';
import 'package:the_process/home/logo_icon.dart';
import 'package:the_process/home/notifications-button/notifications_button.dart';

void main() {
  group('AppBar', () {
    testWidgets('builds LogoIcon, NotificationsButton, AvatarMenuButton',
        ((tester) async {
      final harness = WidgetTestHarness(
        initialBeliefs: AppBeliefs.initial,
        innerWidget: const BasicAppBar(),
      );
      await tester.pumpWidget(harness.widget);

      expect(find.byType(LogoIcon), findsOneWidget);
      expect(find.byType(NotificationsButton), findsOneWidget);
      expect(find.byType(AvatarMenuButton<AppBeliefs>), findsOneWidget);
    }));
  });
}
