import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuliner_flutter/data/constant.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';
import 'package:kuliner_flutter/module/register/bloc/register_bloc.dart';
import 'package:kuliner_flutter/module/utils/helper_utils.dart';
import 'package:kuliner_flutter/module/utils/widget/progress_loading_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  RegisterBloc? registerBloc;
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  String userConfirmationPassword = '';

  @override
  void initState() {
    registerBloc = RegisterBloc( RepositoryProvider.of<UserRepository>(context));
    super.initState();
  }

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: Colors.pink,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: const Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          if (userEmail.isEmpty) {
            toastMessage(context, "Email is Required");
          } else if (userPassword.isEmpty) {
            toastMessage(context, "Password is Required");
          } else if (userName.isEmpty) {
            toastMessage(context, "Username is Required");
          } else if (userConfirmationPassword.isEmpty) {
            toastMessage(context, "Password Confirm is Required");
          } else if (userPassword != userConfirmationPassword) {
            toastMessage(context, "Password Confirm not Same");
          }
          registerBloc?.add(UserRegisterEvent(userName, userEmail, userPassword, userConfirmationPassword));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerBloc!,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoaded) {
              toastMessage(context, "Register Successfully");
              Navigator.of(context).pop();
            } else if (state is RegisterNotLoaded) {
              toastMessage(context, state.message);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/mie-setan.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 250,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                          border: UnderlineInputBorder(), labelText: 'Name'),
                      onChanged: (String text) {
                        userName = text;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Email'),
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
                          labelText: 'Password'),
                      onChanged: (String text) {
                        userPassword = text;
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
                          labelText: 'Password Confirmation'),
                      onChanged: (String text) {
                        userConfirmationPassword = text;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    // child: ProgressLoadingView(),
                    child: state is RegisterLoading ? const ProgressLoadingView() : _buildButton(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 32, bottom: 32),
                        padding: const EdgeInsets.all(4),
                        child: const Text(
                          "Have an Account?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32, bottom: 32),
                        padding: const EdgeInsets.all(4),
                        child: InkWell(
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(Constant.routeLogin);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}