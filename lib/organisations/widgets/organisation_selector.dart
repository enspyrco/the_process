import 'package:percepts/percepts.dart';
import 'package:flutter/material.dart';

import '../../app/app_beliefs.dart';
import '../../projects/missions/tap_projects.dart';
import '../../shared/extensions/build_context_extensions.dart';
import '../cognition/set_selected_organisation.dart';
import '../cognition/tap_organisations.dart';
import '../models/organisation_model.dart';
import '../models/organisation_selector_view_model.dart';

class OrganisationSelector extends StatelessWidget {
  const OrganisationSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<AppBeliefs, OrganisationSelectorViewModel>(
        onInit: (beliefSystem) => beliefSystem.consider(TapOrganisations()),
        onDispose: (beliefSystem) =>
            beliefSystem.consider(TapOrganisations(turnOff: true)),
        infer: (state) => state.organisations.selector,
        builder: (context, selector) {
          return DropdownButton<OrganisationModel>(
            value: selector.selected,
            focusColor: Colors.transparent,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (OrganisationModel? selected) {
              if (selected != null) {
                context.land(SetSelectedOrganisation(selected));
                context.launch(TapProjects(organisationId: selected.id));
              }
            },
            items: selector.all.map<DropdownMenuItem<OrganisationModel>>(
                (OrganisationModel value) {
              return DropdownMenuItem<OrganisationModel>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          );
        });
  }
}
