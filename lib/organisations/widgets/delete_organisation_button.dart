import 'package:percepts/percepts.dart';
import 'package:flutter/material.dart';

import '../../app/state/app_state.dart';
import '../../shared/extensions/build_context_extensions.dart';
import '../cognition/delete_organisation.dart';

class DeleteOrganisationButton extends StatelessWidget {
  const DeleteOrganisationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<AppState, bool>(
      infer: (state) => state.organisations.deleting,
      builder: (context, deleting) => (deleting)
          ? const SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : IconButton(
              onPressed: () {
                context.launch(DeleteOrganisation());
              },
              icon: const Icon(Icons.delete_forever_rounded),
            ),
    );
  }
}
