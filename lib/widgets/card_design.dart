import 'package:flutter/material.dart';
import 'package:flutter_api_handling_methods/constant.dart';

class UserCardDesign extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  const UserCardDesign(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(),
        child: Row(children: [
          Container(
            width: 60,
            height: 60,
            // margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatar),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "FirstName: ",
                        style: kFontSize,
                      ),
                      Text(
                        firstName,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Lastname:",
                        style: kFontSize,
                      ),
                      Text(
                        lastName,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Email: ",
                        style: kFontSize,
                      ),
                      Text(
                        email,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
