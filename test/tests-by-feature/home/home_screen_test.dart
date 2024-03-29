import 'package:test_utils_for_perception/test_utils_for_perception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/home/home_screen.dart';
import 'package:the_process/organisations/widgets/organisation_selector.dart';
import 'package:the_process/projects/widgets/grid-view/projects_grid.dart';

void main() {
  group('Home Screen', () {
    testWidgets('builds BasicAppBar, OrganisationSelector, ProjectsGrid',
        ((tester) async {
      final harness = WidgetTestHarness(
        initialBeliefs: AppBeliefs.initial,
        innerWidget: const HomeScreen(),
      );
      await tester.pumpWidget(harness.widget);

      expect(find.byType(BasicAppBar), findsOneWidget);
      expect(find.byType(OrganisationSelector), findsOneWidget);
      expect(find.byType(ProjectsGrid), findsOneWidget);
    }));
  }, skip: true); // while we decide on a strategy for stubbing services
}
