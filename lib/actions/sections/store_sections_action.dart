import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immutable_collections/immutable_collections.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/sections/section.dart';

part 'store_sections_action.freezed.dart';
part 'store_sections_action.g.dart';

@freezed
class StoreSectionsAction with _$StoreSectionsAction, ReduxAction {
  @JsonSerializable(explicitToJson: true)
  factory StoreSectionsAction({required ImmutableList<Section> list}) =
      _StoreSectionsAction;

  factory StoreSectionsAction.fromJson(Map<String, dynamic> json) =>
      _$StoreSectionsActionFromJson(json);
}
