import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_auth.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference userDocumentCollection({required String collection}) {
  return firestore
      .collection('users')
      .doc(getCurrentUserId())
      .collection(collection);
}

CollectionReference usersCollectionReference() {
  return firestore.collection('users');
}

DocumentReference<Map<String, dynamic>> userDocumentReference() {
  return firestore.collection('users').doc(getCurrentUserId());
}

Future<void> deleteDocumentByReference(DocumentReference reference) async {
  await firestore.runTransaction(
      (Transaction transaction) async => transaction.delete(reference));
}

Future<String> placeSubscriptionInUserFirestore({
  required Timestamp endDate,
  required String subscriptionType,
  required Timestamp startDate,
  required String deliveryAddress,
  required String takeAwayAddress,
  required int addressType,
  required String name,
}) async {
  CollectionReference subscriptions =
      userDocumentCollection(collection: 'subscriptions');
  DocumentReference subscriptionDoc = await subscriptions.add({
    'endDate': endDate.toDate().toIso8601String(),
    'startDate': startDate.toDate().toIso8601String(),
    'subscriptionType': subscriptionType,
    'addressType': addressType.toInt(),
    'deliveryAddress': deliveryAddress,
    'takeAwayAddress': takeAwayAddress,
    'name': name,
  });

  await subscriptions.doc(subscriptionDoc.id).update({
    'subscriptionId': subscriptionDoc.id,
  });
  return subscriptionDoc.id;
}

Future<String> placeOrderInUserFirestore({
  required Timestamp forDate,
  required int orderType,
  required String deliveryAddress,
  required String takeAwayAddress,
}) async {
  CollectionReference subscriptions =
      userDocumentCollection(collection: 'subscriptions');
  DocumentReference subscriptionDoc = await subscriptions.add({
    'forDate': forDate,
    'orderType': orderType,
    'deliveryAddress': deliveryAddress,
    'takeAwayAddress': takeAwayAddress,
  });

  await subscriptions.doc(subscriptionDoc.id).update({
    'subscriptionId': subscriptionDoc.id,
  });
  return subscriptionDoc.id;
}