import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smash/models/models.dart';

class City {
  static String collectionName = 'locations';
  static String citiesCollectionName = 'cities';

  static Future<List<CityModel>> list({
    required String countryId,
    String? lastDocumentId,
  }) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Query<Map<String, dynamic>> query = db
        .collection(collectionName)
        .doc(countryId)
        .collection(citiesCollectionName)
        .orderBy('name')
        .limit(10);

    if (lastDocumentId != null) {
      final lastDoc = await db
          .collection(collectionName)
          .doc(countryId)
          .collection(citiesCollectionName)
          .doc(lastDocumentId)
          .get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }

    QuerySnapshot result = await query.get();

    if (result.size == 0) {
      return [];
    }

    List<CityModel> items = [];

    for (final QueryDocumentSnapshot item in result.docs) {
      items.add(CityModel(
        id: item.id,
        name: item.get('name'),
        subcountry: item.get('subcountry'),
      ));
    }

    return items;
  }
}
