import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab_7/users_model.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  //place the url
  get url_ => 'https://randomuser.me/api/?results=1';

  //save the users from url to users list
  List<Result> users = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of something'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            final user = users[index];
            final first_name = user.name.first;
            final last_name = user.name.last;
            final email = user.email;
            final phone = user.phone;
            final picture = user.picture.thumbnail;

            return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(first_name),
                    Text(last_name),
                    Text(email),
                    Text(phone),
                    Text(picture)

                  ],
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
      ),
    );
  }

  void fetch() async {
    final uri = Uri.parse(url_);
    final response = await http.get(uri);

    String body = '';

    //if successfull
    if(response.statusCode == 200){
      body = response.body;
      print(body);
      //decode json and save to jsonData
      final json_data = jsonDecode(body);
      Result result = Result.fromJson(json_data);

      print('Name : ${result.name.first}');
      print('Email : ${result.email}');
      print('phone : ${result.phone}');
      print('Picture: ${result.picture.thumbnail}');

      final results = json_data['results'] as List<dynamic>;
      final converted = results.map((user) {
        return Result.fromJson(user);
      }).toList();

      setState(() {
        users = converted;
      });

    }
  }
}
