import 'package:json_utils/json_utils.dart';
import 'package:abstractions/beliefs.dart';

import '../../app/state/app_state.dart';
import '../../projects/models/section_model.dart';

class SetSections extends Conclusion<AppState> {
  const SetSections({required List<SectionModel> list}) : _list = list;

  final List<SectionModel> _list;

  @override
  AppState update(AppState state) {
    var newSections = state.sections.copyWith(list: _list);
    return state.copyWith(sections: newSections);
  }

  factory SetSections.fromJson(Map<String, dynamic> json) => SetSections(
      list: (json['list'] as List<JsonMap>)
          .map<SectionModel>((e) => SectionModel.fromJson(e))
          .toList());

  @override
  toJson() => {
        'name_': 'SetSection',
        'state_': {'list': _list.map((e) => e.toJson()).toList()},
      };
}
