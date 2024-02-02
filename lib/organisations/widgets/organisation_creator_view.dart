import 'package:percepts/percepts.dart';
import 'package:flutter/material.dart';

import '../../app/app_beliefs.dart';
import '../../shared/extensions/build_context_extensions.dart';
import '../cognition/create_organisation.dart';
import '../models/organisation_model.dart';

class OrganisationCreatorView extends StatefulWidget {
  const OrganisationCreatorView({Key? key}) : super(key: key);

  @override
  State<OrganisationCreatorView> createState() =>
      _OrganisationCreatorViewState();
}

class _OrganisationCreatorViewState extends State<OrganisationCreatorView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<AppBeliefs, bool>(
        infer: (state) => state.organisations.creator.creating,
        builder: (context, creating) {
          if (!creating) _controller.text = '';
          return SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Name...'),
                  ),
                ),
                (creating)
                    ? const SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => context.launch(CreateOrganisation(
                            OrganisationModel.initWith(
                                name: _controller.text))),
                        hoverColor: Colors.transparent,
                        splashRadius: 20,
                      ),
              ],
            ),
          );
        });
  }
}
