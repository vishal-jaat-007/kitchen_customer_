import 'package:cloud_firestore/cloud_firestore.dart';

class OrderApi {
  static final _firestore = FirebaseFirestore.instance;

  // Collection Reference
  static CollectionReference orderCollectionRef =
      _firestore.collection("orders");

  // Method to generate an order
  static Future<void> generateOrder({
    required String userId,
    required List<Map<String, dynamic>> items,
    required double totalPrice,
    required Map<String, dynamic> deliveryAddress,
  }) async {
    try {
      await orderCollectionRef.add({
        'userId': userId,
        'items': items,
        'totalPrice': totalPrice,
        'status': 'pending', // Initial status
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
        'deliveryAddress': deliveryAddress,
      });
    } catch (e) {
      throw Exception('Failed to generate order: $e');
    }
  }

  // Method to fetch orders for a specific user
  static Future<List<Map<String, dynamic>>> fetchUserOrders({
    required String userId,
  }) async {
    try {
      QuerySnapshot snapshot = await orderCollectionRef
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();
      return snapshot.docs
          .map((doc) =>
              {'orderId': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch orders: $e');
    }
  }
}
