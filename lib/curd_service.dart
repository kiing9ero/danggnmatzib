import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CurdService extends ChangeNotifier {
  final datacollection = FirebaseFirestore.instance.collection('miniproj');

  Future<QuerySnapshot> read(String uid) async {
    // 내 bucketList 가져오기
    throw UnimplementedError(); // return 값 미구현 에러
  }

  void create(String job, String uid) async {
    // bucket 만들기
  }

  void update(String docId, bool isDone) async {
    // bucket isDone 업데이트
  }

  void delete(String docId) async {
    // bucket 삭제
  }
}
