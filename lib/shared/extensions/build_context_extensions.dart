import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:flutter/widgets.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/app_beliefs.dart';

extension BuildContextExtension on BuildContext {
  void land(Conclusion<AppBeliefs> mission) {
    return locate<BeliefSystem<AppBeliefs>>().conclude(mission);
    // return AstroBase.findBeliefSystemOf<AppState>(this, listen: false)
    //     .land(mission);
  }

  Future<void> launch(Consideration<AppBeliefs> mission) {
    return locate<BeliefSystem<AppBeliefs>>().consider(mission);
    // return AstroBase.findBeliefSystemOf<AppState>(this, listen: false)
    //     .launch(mission);
  }
}
