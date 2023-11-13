import 'package:flutter/material.dart';
import 'package:kuliner_flutter/data/constant.dart';

class LoginRequiredView extends StatefulWidget {
  const LoginRequiredView({super.key});

  @override
  State<LoginRequiredView> createState() => _LoginRequiredViewState();
}

class _LoginRequiredViewState extends State<LoginRequiredView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Login is required',
              style: TextStyle(
                fontSize: 16,
                color: Colors.pink,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            width: 225.0,
            height: 50.0,
            child: MaterialButton(
              color: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Colors.pink,
                  style: BorderStyle.solid,
                  width: 2
                )
              ),
              child: Text('Login', 
              style: TextStyle(
                color: Colors.pink, 
                fontSize: 18
                ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(Constant.routeLogin).then((value) {
                    
                  });
              },
              ),
          )
        ],
      ),
    );
  }
}