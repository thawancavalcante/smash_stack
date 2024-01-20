import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smash/models/models.dart';

class Country {
  static String collectionName = 'locations';

  static Future<List<CountryModel>> list({String? lastDocumentId}) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Query<Map<String, dynamic>> query =
        db.collection(collectionName).orderBy('name').limit(10);

    if (lastDocumentId != null) {
      final lastDoc =
          await db.collection(collectionName).doc(lastDocumentId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }

    QuerySnapshot result = await query.get();

    if (result.size == 0) {
      return [];
    }

    List<CountryModel> items = [];

    for (final QueryDocumentSnapshot item in result.docs) {
      items.add(CountryModel(
        id: item.id,
        name: item.get('name'),
      ));
    }

    return items;
  }
}
