import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_handling_methods/widgets/card_design.dart';
import 'package:flutter_api_handling_methods/constant.dart';
import 'package:flutter_api_handling_methods/models/user_model.dart';
import 'package:flutter_api_handling_methods/services/api_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool _loading = true;
  late List<User> userlist = [];

  // late List<User> userlist = [
  //   User(
  //       id: 12,
  //       firstName: "Parthasarathy",
  //       lastName: "k",
  //       email: "sarathi475@gmail.com",
  //       avatar: "https://reqres.in/img/faces/9-image.jpg")
  // ];

  APIHandler apiHandler = APIHandler();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      setState(() {
        _loading = false;
      });
    });
    _getinformation();
  }

  void _getinformation() async {
    var userInfo = await apiHandler.get().catchError((error) => {});
    // print("response : ${userInfo}");

    if (userInfo != null && userInfo != "{}") {
      var decode = jsonDecode(userInfo)["data"];
      setState(() {
        userlist = userFromJson(decode);
      });
      // print(userlist.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Flutter Api Handling methods"),
      ),
      body: _loading
          ? CustomLoader()
          : userlist.length == 0
              ? Container(
                  child: Center(
                    child: Text("There is no user information"),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      itemCount: userlist.length,
                      itemBuilder: (context, index) {
                        return UserCardDesign(
                            firstName: userlist[index].firstName,
                            lastName: userlist[index].lastName,
                            email: userlist[index].email,
                            avatar: userlist[index].avatar);
                      }),
                ),
    );
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: ListView.builder(
          itemCount: 16,
          itemBuilder: (context, index) {
            return const LoaderStuct();
          }),
    );
  }
}

class LoaderStuct extends StatelessWidget {
  const LoaderStuct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fullWeight = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(6)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Skelton(height: 15, weight: fullWeight - 80),
                SizedBox(
                  height: 5,
                ),
                Skelton(height: 15, weight: fullWeight - 80),
                SizedBox(
                  height: 5,
                ),
                Skelton(height: 15, weight: fullWeight - 80)
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  final double height;
  final double weight;

  const Skelton({Key? key, required this.height, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: weight,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
