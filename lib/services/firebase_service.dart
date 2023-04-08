import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//future similar a promis
//funcion para leer db
Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection('people');
  //se debe limitar cantidad de registros, no poner get solo
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  for(var doc in queryPeople.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": doc.id,
    };
    people.add(person);
  }

  //await Future.delayed(const Duration(seconds: 1));
  return people;
}

//funcion para guardar name
Future<void> addPeople(String name) async {
  await db.collection("people").add({"name": name});
}

//funcion actualizar
Future<void> updatePeople(String uid, String newName) async {
  await db.collection("people").doc(uid).set({"name": newName});
}