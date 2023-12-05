import 'package:flutter/material.dart';
import 'package:kuliner_flutter/module/utils/widget/progress_loading_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  String userEmail = '';
  String userPassword = '';

  Widget _buildButton() {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: Colors.pink,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: const Text('Login', style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),),
        onPressed: (){

        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/mie-setan.jpg"),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                const SizedBox(
                  height: 250,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email'
                ),
                onChanged: (String text) {
                  userEmail = text;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: TextFormField(
                obscureText: true,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password'
                ),
                onChanged: (String text) {
                  userPassword = text;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
              // child: ProgressLoadingView(),
              child: _buildButton(),
            )
          ],
        ),
      ),
    );
  }
}
