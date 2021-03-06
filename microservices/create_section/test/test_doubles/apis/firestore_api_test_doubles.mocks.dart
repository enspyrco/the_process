// Mocks generated by Mockito 5.0.0-nullsafety.7 from annotations
// in create_section/test/test_doubles/apis/firestore_api_test_doubles.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:googleapis/firestore/v1.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeProjectsResource extends _i1.Fake implements _i2.ProjectsResource {}

class _FakeProjectsDatabasesResource extends _i1.Fake
    implements _i2.ProjectsDatabasesResource {}

class _FakeProjectsLocationsResource extends _i1.Fake
    implements _i2.ProjectsLocationsResource {}

class _FakeProjectsDatabasesCollectionGroupsResource extends _i1.Fake
    implements _i2.ProjectsDatabasesCollectionGroupsResource {}

class _FakeProjectsDatabasesDocumentsResource extends _i1.Fake
    implements _i2.ProjectsDatabasesDocumentsResource {}

class _FakeProjectsDatabasesOperationsResource extends _i1.Fake
    implements _i2.ProjectsDatabasesOperationsResource {}

class _FakeGoogleLongrunningOperation extends _i1.Fake
    implements _i2.GoogleLongrunningOperation {}

class _FakeBatchGetDocumentsResponse extends _i1.Fake
    implements _i2.BatchGetDocumentsResponse {}

class _FakeBatchWriteResponse extends _i1.Fake
    implements _i2.BatchWriteResponse {}

class _FakeBeginTransactionResponse extends _i1.Fake
    implements _i2.BeginTransactionResponse {}

class _FakeCommitResponse extends _i1.Fake implements _i2.CommitResponse {}

class _FakeDocument extends _i1.Fake implements _i2.Document {}

class _FakeEmpty extends _i1.Fake implements _i2.Empty {}

class _FakeListDocumentsResponse extends _i1.Fake
    implements _i2.ListDocumentsResponse {}

class _FakeListCollectionIdsResponse extends _i1.Fake
    implements _i2.ListCollectionIdsResponse {}

class _FakeListenResponse extends _i1.Fake implements _i2.ListenResponse {}

class _FakePartitionQueryResponse extends _i1.Fake
    implements _i2.PartitionQueryResponse {}

class _FakeRunQueryResponse extends _i1.Fake implements _i2.RunQueryResponse {}

class _FakeWriteResponse extends _i1.Fake implements _i2.WriteResponse {}

/// A class which mocks [FirestoreApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreApi extends _i1.Mock implements _i2.FirestoreApi {
  MockFirestoreApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProjectsResource get projects =>
      (super.noSuchMethod(Invocation.getter(#projects),
          returnValue: _FakeProjectsResource()) as _i2.ProjectsResource);
}

/// A class which mocks [ProjectsResource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProjectsResource extends _i1.Mock implements _i2.ProjectsResource {
  MockProjectsResource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProjectsDatabasesResource get databases =>
      (super.noSuchMethod(Invocation.getter(#databases),
              returnValue: _FakeProjectsDatabasesResource())
          as _i2.ProjectsDatabasesResource);
  @override
  _i2.ProjectsLocationsResource get locations =>
      (super.noSuchMethod(Invocation.getter(#locations),
              returnValue: _FakeProjectsLocationsResource())
          as _i2.ProjectsLocationsResource);
}

/// A class which mocks [ProjectsDatabasesResource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProjectsDatabasesResource extends _i1.Mock
    implements _i2.ProjectsDatabasesResource {
  MockProjectsDatabasesResource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProjectsDatabasesCollectionGroupsResource get collectionGroups =>
      (super.noSuchMethod(Invocation.getter(#collectionGroups),
              returnValue: _FakeProjectsDatabasesCollectionGroupsResource())
          as _i2.ProjectsDatabasesCollectionGroupsResource);
  @override
  _i2.ProjectsDatabasesDocumentsResource get documents =>
      (super.noSuchMethod(Invocation.getter(#documents),
              returnValue: _FakeProjectsDatabasesDocumentsResource())
          as _i2.ProjectsDatabasesDocumentsResource);
  @override
  _i2.ProjectsDatabasesOperationsResource get operations =>
      (super.noSuchMethod(Invocation.getter(#operations),
              returnValue: _FakeProjectsDatabasesOperationsResource())
          as _i2.ProjectsDatabasesOperationsResource);
  @override
  _i3.Future<_i2.GoogleLongrunningOperation> exportDocuments(
          _i2.GoogleFirestoreAdminV1ExportDocumentsRequest? request,
          String? name,
          {String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #exportDocuments, [request, name], {#$fields: $fields}),
              returnValue: Future.value(_FakeGoogleLongrunningOperation()))
          as _i3.Future<_i2.GoogleLongrunningOperation>);
  @override
  _i3.Future<_i2.GoogleLongrunningOperation> importDocuments(
          _i2.GoogleFirestoreAdminV1ImportDocumentsRequest? request,
          String? name,
          {String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #importDocuments, [request, name], {#$fields: $fields}),
              returnValue: Future.value(_FakeGoogleLongrunningOperation()))
          as _i3.Future<_i2.GoogleLongrunningOperation>);
}

/// A class which mocks [ProjectsDatabasesDocumentsResource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProjectsDatabasesDocumentsResource extends _i1.Mock
    implements _i2.ProjectsDatabasesDocumentsResource {
  MockProjectsDatabasesDocumentsResource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.BatchGetDocumentsResponse> batchGet(
          _i2.BatchGetDocumentsRequest? request, String? database,
          {String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #batchGet, [request, database], {#$fields: $fields}),
              returnValue: Future.value(_FakeBatchGetDocumentsResponse()))
          as _i3.Future<_i2.BatchGetDocumentsResponse>);
  @override
  _i3.Future<_i2.BatchWriteResponse> batchWrite(
          _i2.BatchWriteRequest? request, String? database,
          {String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #batchWrite, [request, database], {#$fields: $fields}),
              returnValue: Future.value(_FakeBatchWriteResponse()))
          as _i3.Future<_i2.BatchWriteResponse>);
  @override
  _i3.Future<_i2.BeginTransactionResponse> beginTransaction(
          _i2.BeginTransactionRequest? request, String? database,
          {String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #beginTransaction, [request, database], {#$fields: $fields}),
              returnValue: Future.value(_FakeBeginTransactionResponse()))
          as _i3.Future<_i2.BeginTransactionResponse>);
  @override
  _i3.Future<_i2.CommitResponse> commit(
          _i2.CommitRequest? request, String? database, {String? $fields}) =>
      (super.noSuchMethod(
          Invocation.method(#commit, [request, database], {#$fields: $fields}),
          returnValue:
              Future.value(_FakeCommitResponse())) as _i3
          .Future<_i2.CommitResponse>);
  @override
  _i3.Future<_i2.Document> createDocument(
          _i2.Document? request, String? parent, String? collectionId,
          {String? documentId,
          List<String>? mask_fieldPaths,
          String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(#createDocument, [
                request,
                parent,
                collectionId
              ], {
                #documentId: documentId,
                #mask_fieldPaths: mask_fieldPaths,
                #$fields: $fields
              }),
              returnValue: Future.value(_FakeDocument()))
          as _i3.Future<_i2.Document>);
  @override
  _i3.Future<_i2.Empty> delete(String? name,
          {bool? currentDocument_exists,
          String? currentDocument_updateTime,
          String? $fields}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [
            name
          ], {
            #currentDocument_exists: currentDocument_exists,
            #currentDocument_updateTime: currentDocument_updateTime,
            #$fields: $fields
          }),
          returnValue: Future.value(_FakeEmpty())) as _i3.Future<_i2.Empty>);
  @override
  _i3.Future<_i2.Document> get(String? name,
          {List<String>? mask_fieldPaths,
          String? readTime,
          String? transaction,
          String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [
                name
              ], {
                #mask_fieldPaths: mask_fieldPaths,
                #readTime: readTime,
                #transaction: transaction,
                #$fields: $fields
              }),
              returnValue: Future.value(_FakeDocument()))
          as _i3.Future<_i2.Document>);
  @override
  _i3.Future<_i2.ListDocumentsResponse> list(
          String? parent, String? collectionId,
          {List<String>? mask_fieldPaths,
          String? orderBy,
          int? pageSize,
          String? pageToken,
          String? readTime,
          bool? showMissing,
          String? transaction,
          String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(#list, [
                parent,
                collectionId
              ], {
                #mask_fieldPaths: mask_fieldPaths,
                #orderBy: orderBy,
                #pageSize: pageSize,
                #pageToken: pageToken,
                #readTime: readTime,
                #showMissing: showMissing,
                #transaction: transaction,
                #$fields: $fields
              }),
              returnValue: Future.value(_FakeListDocumentsResponse()))
          as _i3.Future<_i2.ListDocumentsResponse>);
  @override
  _i3.Future<_i2.ListCollectionIdsResponse> listCollectionIds(
          _i2.ListCollectionIdsRequest? request, String? parent,
          {String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #listCollectionIds, [request, parent], {#$fields: $fields}),
              returnValue: Future.value(_FakeListCollectionIdsResponse()))
          as _i3.Future<_i2.ListCollectionIdsResponse>);
  @override
  _i3.Future<_i2.ListenResponse> listen(
          _i2.ListenRequest? request, String? database, {String? $fields}) =>
      (super.noSuchMethod(
          Invocation.method(#listen, [request, database], {#$fields: $fields}),
          returnValue:
              Future.value(_FakeListenResponse())) as _i3
          .Future<_i2.ListenResponse>);
  @override
  _i3.Future<_i2.PartitionQueryResponse> partitionQuery(
          _i2.PartitionQueryRequest? request, String? parent,
          {String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #partitionQuery, [request, parent], {#$fields: $fields}),
              returnValue: Future.value(_FakePartitionQueryResponse()))
          as _i3.Future<_i2.PartitionQueryResponse>);
  @override
  _i3.Future<_i2.Document> patch(_i2.Document? request, String? name,
          {bool? currentDocument_exists,
          String? currentDocument_updateTime,
          List<String>? mask_fieldPaths,
          List<String>? updateMask_fieldPaths,
          String? $fields}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [
                request,
                name
              ], {
                #currentDocument_exists: currentDocument_exists,
                #currentDocument_updateTime: currentDocument_updateTime,
                #mask_fieldPaths: mask_fieldPaths,
                #updateMask_fieldPaths: updateMask_fieldPaths,
                #$fields: $fields
              }),
              returnValue: Future.value(_FakeDocument()))
          as _i3.Future<_i2.Document>);
  @override
  _i3.Future<_i2.Empty> rollback(_i2.RollbackRequest? request, String? database,
          {String? $fields}) =>
      (super.noSuchMethod(
          Invocation.method(
              #rollback, [request, database], {#$fields: $fields}),
          returnValue: Future.value(_FakeEmpty())) as _i3.Future<_i2.Empty>);
  @override
  _i3.Future<_i2.RunQueryResponse> runQuery(
          _i2.RunQueryRequest? request, String? parent, {String? $fields}) =>
      (super.noSuchMethod(
          Invocation.method(#runQuery, [request, parent], {#$fields: $fields}),
          returnValue:
              Future.value(_FakeRunQueryResponse())) as _i3
          .Future<_i2.RunQueryResponse>);
  @override
  _i3.Future<_i2.WriteResponse> write(
          _i2.WriteRequest? request, String? database, {String? $fields}) =>
      (super.noSuchMethod(
          Invocation.method(#write, [request, database], {#$fields: $fields}),
          returnValue:
              Future.value(_FakeWriteResponse())) as _i3
          .Future<_i2.WriteResponse>);
}
