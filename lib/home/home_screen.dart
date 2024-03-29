import 'package:flutterfire_firebase_auth_for_perception/flutterfire_firebase_auth_for_perception.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:flutter/material.dart';

import '../app/app_beliefs.dart';
import '../organisations/routes/manage_organisations_page_state.dart';
import '../organisations/widgets/organisation_selector.dart';
import '../projects/widgets/grid-view/projects_grid.dart';
import 'logo_icon.dart';
import 'notifications-button/notifications_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [OrganisationSelector()],
          ),
          ProjectsGrid()
        ],
      ),
    );
  }
}

class BasicAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BasicAppBar({Key? key}) : super(key: key);

  @override
  State<BasicAppBar> createState() => _BasicAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _BasicAppBarState extends State<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              LogoIcon(),
              Spacer(),
              NotificationsButton(),
              AvatarMenuButton<AppBeliefs>(
                options: {
                  MenuOption('Sign Out', SigningOut<AppBeliefs>()),
                  MenuOption('Manage Organisations',
                      AddTopLayer<AppBeliefs>(ManageOrganisationsPageState())),
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
