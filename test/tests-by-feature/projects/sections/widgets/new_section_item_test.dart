import 'package:test_utils_for_perception/test_utils_for_perception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/app_beliefs.dart';
import 'package:the_process/projects/widgets/project-detail/new_section_item.dart';
import 'package:the_process/sections/missions/create_section.dart';
import 'package:the_process/sections/missions/update_new_section_v_m.dart';

void main() {
  testWidgets('NewSectionItem dispatches UpdateNewSectionVM on text entry',
      (WidgetTester tester) async {
    // Setup the harness and check it is in the initial state.
    final harness = WidgetTestHarness(
      initialBeliefs: AppBeliefs.initial,
      innerWidget: const NewSectionItem(),
    );
    expect(harness.state.sections.newName, '');

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    final textField = find.byType(TextField);
    final button = find.byType(FloatingActionButton);

    expect(textField, findsOneWidget);
    expect(button, findsOneWidget);

    await tester.enterText(textField, 'a');

    expect(harness.recordedCognitions,
        contains(const UpdateNewSectionVM(name: 'a')));
  }, skip: true); // While we sort our Sections and how they will work

  testWidgets('NewSectionItem dispatches CreateSection on submit',
      (WidgetTester tester) async {
    // setup the harness and check it is in the initial state
    final harness = WidgetTestHarness(
      initialBeliefs: AppBeliefs.initial,
      innerWidget: const NewSectionItem(),
    );
    expect(harness.state.sections.newName, '');

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    final textField = find.byType(TextField);
    final button = find.byType(FloatingActionButton);

    expect(textField, findsOneWidget);
    expect(button, findsOneWidget);

    await tester.tap(button);

    expect(harness.recordedCognitions, contains(const CreateSection()));
  }, skip: true); // While we sort our Sections and how they will work
}
