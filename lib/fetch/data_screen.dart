import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_service_customer/resources/utils/app_color.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Data'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("meal").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data!.docs.map((e) => e.data()).toList();
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                final meal = item["meals"][0];

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor().darkorange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(meal["meal_type"]),
                          Text(meal["meal_category"]),
                          Text(meal["meal_id"]),
                          Text(meal["meal_name"]),
                          Text(
                              "SDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFsdfggggggggggggggggggggggggf")
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
