import 'package:http/http.dart' as http;
import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';
import 'update_sections_v_m.dart';

final http.Client _client = http.Client();

class CreateSection extends Consideration<AppState> {
  const CreateSection();

  @override
  Future<void> consider(BeliefSystem<AppState> beliefSystem) async {
    final queryParameters = {'name': beliefSystem.beliefs.sections.newName};
    final uri = Uri.https(
        'section-creation-v6exb2sdca-uc.a.run.app', '', queryParameters);
    final response = await _client.post(uri);
    if (response.statusCode != 200) {
      throw '${response.statusCode} : ${response.reasonPhrase}';
    }

    beliefSystem.conclude(const UpdateSectionsVM(creatingNewSection: true));
  }

  @override
  toJson() => {'name_': 'CreateSection', 'state_': <String, dynamic>{}};
}
