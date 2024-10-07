import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllUsersPage extends StatelessWidget {
  const AllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("User ke ${index + 1}"),
            onTap: () {
              context.pushNamed("detail_user");
            },
          );
        },
        itemCount: 10,
      ),
    );
  }
}
