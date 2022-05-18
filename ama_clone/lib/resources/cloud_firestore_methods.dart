import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_details_model.dart';

/// This class contains all the Various functions that are used in the Firestore
class CloudFirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// This function is used to add a new user to the firestore database
  Future uploadUserInfo({
    required UserDetailsModel user,
  }) async {
    firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }
}
  // static const String getDocuments = 'getDocuments';
  // static const String getDocumentsWithOptions = 'getDocumentsWithOptions';
  // static const String addDocument = 'addDocument';
  // static const String updateDocument = 'updateDocument';
  // static const String deleteDocument = 'deleteDocument';
  // static const String batchGetDocuments = 'batchGetDocuments';
  // static const String runTransaction = 'runTransaction';
  // static const String listen = 'listen';
  // static const String onSnapshot = 'onSnapshot';
  // static const String onSnapshotsInSync = 'onSnapshotsInSync';
  // static const String onEvent = 'onEvent';
  // static const String onError = 'onError';
  // static const String onListen = 'onListen';
  // static const String onEventWithSnapshot = 'onEventWithSnapshot';
  // static const String onErrorWithSnapshot = 'onErrorWithSnapshot';
  // static const String onListenWithSnapshot = 'onListenWithSnapshot';
  // static const String onEventWithSnapshotAndMetadata =
  //     'onEventWithSnapshotAndMetadata';
  // static const String onErrorWithSnapshotAndMetadata =
  //     'onErrorWithSnapshotAndMetadata';
  // static const String onListenWithSnapshotAndMetadata =
  //     'onListenWithSnapshotAndMetadata';
  // static const String onEventWithSnapshotAndMetadataAndError =
  //     'onEventWithSnapshotAndMetadataAndError';
  // static const String onErrorWithSnapshotAndMetadataAndError =
  //     'onErrorWithSnapshotAndMetadataAndError';
  // static const String onListenWithSnapshotAndMetadataAndError =
  //     'onListenWithSnapshotAndMetadataAndError';
  // static const String onEventWithSnapshotAndError =
  //     'onEventWithSnapshotAndError';
  // static const String onErrorWithSnapshotAndError =
  //     'onErrorWithSnapshotAndError';
  // static const String onListenWithSnapshotAndError =
  //     'onListenWithSnapshotAndError';
  // static const String onEventWithSnapshotAndMetadataAndErrorAndSnapshot =
  //     'onEventWithSnapshotAndMetadataAndErrorAndSnap