import 'package:flutter/material.dart';
import 'package:ecomerce_store_app/model/user_model.dart';
import 'package:ecomerce_store_app/services/api_handler.dart';
import 'package:ecomerce_store_app/widgets/widget_export.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
static String routeName = "/chat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: FutureBuilder<List<UsersModel>>(
        future: APIHandler.getAllUsers(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text("An error occured ${snapshot.error}"),
            );
          } else if (snapshot.data == null) {
            const Center(
              child: Text("No products has been added yet"),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                  child: const UsersWidget(),
                );
              });
        }),
      ),
    );
  }
}
