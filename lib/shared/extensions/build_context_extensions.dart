import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:flutter/widgets.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';

extension BuildContextExtension on BuildContext {
  void land(Conclusion<AppState> mission) {
    return locate<BeliefSystem<AppState>>().conclude(mission);
    // return AstroBase.findBeliefSystemOf<AppState>(this, listen: false)
    //     .land(mission);
  }

  Future<void> launch(Consideration<AppState> mission) {
    return locate<BeliefSystem<AppState>>().consider(mission);
    // return AstroBase.findBeliefSystemOf<AppState>(this, listen: false)
    //     .launch(mission);
  }
}
