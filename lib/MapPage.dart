import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miniproj_with_firebase/auth_service.dart';
import 'package:miniproj_with_firebase/loginpage.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:provider/provider.dart';

class NaverMapTest extends StatefulWidget {
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        actions: [
          TextButton(
            child: Text(
              "로그아웃",
              style: TextStyle(
                color: Colors.black,
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
      body: Stack(
        children: [
          Container(
            child: NaverMap(
              onMapCreated: onMapCreated,
              mapType: _mapType,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text("라멘"),
                      color: Colors.grey,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text("스시"),
                      color: Colors.grey,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text("우동"),
                      color: Colors.grey,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text("모밀"),
                      color: Colors.grey,
                      width: 60,
                      height: 60,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 300,
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
