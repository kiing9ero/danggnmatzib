import 'package:flutter/material.dart';
import 'package:miniproj_with_firebase/MainPage.dart';
import 'package:miniproj_with_firebase/homepage.dart';
import 'package:miniproj_with_firebase/MapPage.dart';
import 'package:miniproj_with_firebase/registration.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';
import 'curd_service.dart';

//로그인페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser();
        return Consumer<CurdService>(
          builder: (context, curdservice, child) {
            return Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// 현재 유저 로그인 상태
                    Center(
                      child: Column(
                        children: [
                          Image.asset("assets/images/logo.jpeg"),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "이랏샤이마세!! 🙂",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "당신 근처의 일식 맛집",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            user == null
                                ? "로그인해 주세요 🙂"
                                : "${user.email}님 안녕하세요 👋",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),

                    /// 이메일
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: "이메일"),
                    ),

                    /// 비밀번호
                    TextField(
                      controller: passwordController,
                      obscureText: false, // 비밀번호 안보이게
                      decoration: InputDecoration(hintText: "비밀번호"),
                    ),
                    SizedBox(height: 32),

                    /// 로그인 버튼
                    ElevatedButton(
                      child: Text("로그인", style: TextStyle(fontSize: 21)),
                      onPressed: () {
                        // 로그인
                        authService.signIn(
                          email: emailController.text,
                          password: passwordController.text,
                          onSuccess: () {
                            // 로그인 성공
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("로그인 성공"),
                            ));

                            // MainPage로 이동
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                            );
                          },
                          onError: (err) {
                            // 에러 발생
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(err),
                            ));
                          },
                        );
                      },
                    ),

                    /// 회원가입 버튼
                    ElevatedButton(
                      child: Text("회원가입", style: TextStyle(fontSize: 21)),
                      onPressed: () {
                        //회원가입 페이지로 이동
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
