import 'package:astro_types/state_types.dart';

class SectionModel implements AstroState {
  const SectionModel({
    required this.name,
    required this.folderId,
    required this.useCasesDocId,
  });

  final String name;
  final String folderId;
  final String useCasesDocId;

  @override
  SectionModel copyWith({
    String? name,
    String? folderId,
    String? useCasesDocId,
  }) =>
      SectionModel(
        name: name ?? this.name,
        folderId: folderId ?? this.folderId,
        useCasesDocId: useCasesDocId ?? this.useCasesDocId,
      );

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        name: json['json'] as String,
        folderId: json['folderId'] as String,
        useCasesDocId: json['useCasesDocId'] as String,
      );

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}