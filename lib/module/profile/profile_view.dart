import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:kuliner_flutter/data/model/profile_model.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';
import 'package:kuliner_flutter/module/profile/bloc/profile_bloc.dart';
import 'package:kuliner_flutter/module/utils/widget/login_required_view.dart';
import 'package:kuliner_flutter/module/utils/widget/progress_loading_view.dart';

class ProfileView extends StatefulWidget {

  final VoidCallback callback;

  const ProfileView({
    required this.callback,
    super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileBloc? profileBloc;

  @override
  void initState() {
    profileBloc = ProfileBloc(RepositoryProvider.of<UserRepository>(context));
    profileBloc?.add(CheckLoginEvent());
    super.initState();
  }

  Widget _buildProfile(ProfileModel profile) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/avatar_profile.png"),
                    fit: BoxFit.contain
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  profile.email,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.normal
                  ),
                ),
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            color: Colors.black12,
            height: 0.5,
          ),
          InkWell(
            onTap: () {
              widget.callback();
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Favourites',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.black87,
                )
            )
                ],
              )
          ),
          ),
          Container(
            //margin: EdgeInsets.only(top: 16),
            color: Colors.black12,
            height: 0.5,
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.black87,
                )
            )
                ],
              )
          ),
          ),
          Container(
            color: Colors.black12,
            height: 0.5,
          ),
          InkWell(
            onTap: () {
              profileBloc?.add(UserLogoutEvent());
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal
                  ),
                ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.black87,
                )
            )
                ],
              )
          ),
          )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc!,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileIsLogin) {
            profileBloc?.add(GetProfileEvent(state.token));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const ProgressLoadingView();
          } else if (state is ProfileIsNotLogin) {
            return FocusDetector(
              onFocusGained: () {
                profileBloc?.add( CheckLoginEvent() );
              },
              child: LoginRequiredView(
                callback: () {
                  profileBloc?.add( CheckLoginEvent() );
                },
              ),
            );
          } else if (state is ProfileLoaded) {
            return _buildProfile(state.profileModel);
          }
          return Container();
        },
      ),
    );
  }
}
