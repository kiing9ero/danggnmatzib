import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miniproj_with_firebase/loginpage.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';

//홈페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("지도보기"),
        actions: [
          TextButton(
            child: Text(
              "로그아웃",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              // 로그아웃
              context.read<AuthService>().signOut();

              // 로그인 페이지로 이동
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(children: [
        /// 입력창
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              /// 텍스트 입력창
              Expanded(
                child: TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    hintText: "하고 싶은 일을 입력해주세요.",
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
