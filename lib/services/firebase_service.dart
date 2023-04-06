import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//future similar a promis
//funcion para leer db
Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection('people');
  //limitar cantidad de registros, no poner get solo
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  queryPeople.docs.forEach((documento) {
    people.add(documento.data());
  });

  await Future.delayed(const Duration(seconds: 3));
  return people;
}
