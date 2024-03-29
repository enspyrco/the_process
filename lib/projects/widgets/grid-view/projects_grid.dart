import 'package:percepts/percepts.dart';
import 'package:flutter/material.dart';

import '../../../app/app_beliefs.dart';
import '../../models/project_state.dart';
import 'new_project_item.dart';
import 'project_item.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<AppBeliefs, Set<ProjectState>>(
        infer: (state) => state.projects.all,
        builder: (context, projects) {
          return GridView.count(
            shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            // Generate 100 widgets that display their index in the List.
            children:
                projects.map<Widget>((project) => ProjectItem(project)).toList()
                  ..insert(0, const NewProjectItem()),
          );
        });
  }
}
