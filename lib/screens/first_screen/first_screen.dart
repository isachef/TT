import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technical_task/screens/first_screen/bloc/user_bloc.dart';
import 'package:technical_task/screens/second_screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late UserBloc _userBloc;
  late var userList;

  @override
  void initState() {
    _userBloc = UserBloc();
    _userBloc.add(GetUsersEvent());
    // userList= await Hive.openBox('userList');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('USERS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<UserBloc, UserState>(
          bloc: _userBloc,
          listener: (context, state) {
            if (state is UserErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error.message!),
              ));
            }
          },
          builder: (context, state) {
            if (state is UsersFetchedState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.userModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            userModel: state.userModelList[index],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 80,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'USERNAME: ${state.userModelList[index].username}'),
                            SizedBox(height: 10),
                            Text('NAME: ${state.userModelList[index].name}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container(
              child: Column(
                children: [],
              ),
            );
          },
        ),
      ),
    );
  }
}
