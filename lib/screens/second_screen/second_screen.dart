import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/models/user_model.dart';
import 'package:technical_task/screens/fourth_screen/fourth_screen.dart';
import 'package:technical_task/screens/second_screen/blo%D1%81/post_bloc.dart';
import 'package:technical_task/screens/third_screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final UserModel userModel;

  const SecondScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = PostBloc();
    _postBloc.add(GetThreePosts(id: widget.userModel.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userModel.username!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'name : ${widget.userModel.name!}',
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            Text(
              'email : ${widget.userModel.email}',
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            Text(
              'phone : ${widget.userModel.phone}',
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            Text(
              'website : ${widget.userModel.website}',
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            const Text(
              'Work',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.indigo),
            ),
            Text(
              'work name : ${widget.userModel.company!.name} \nbs : ${widget.userModel.company!.bs}',
              style: const TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            Text(
              'phrace : ${widget.userModel.company!.catchPhrase}',
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
            BlocConsumer<PostBloc, PostState>(
              bloc: _postBloc,
              listener: (context, state) {
                if (state is PostErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error.message!),
                  ));
                }
              },
              builder: (context, state) {
                if (state is ThreePostFetchedState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.postModelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          _postBloc.close();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FourthScreen(
                                id: widget.userModel.id!,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.orangeAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  state.postModelList[index].title!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                Text(state.postModelList[index].body!),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
            BlocConsumer<PostBloc, PostState>(
              bloc: _postBloc,
              listener: (context, state) {
                if (state is PostErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error.message!),
                  ));
                }
              },
              builder: (context, state) {
                if (state is ThreePostFetchedState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.albumModelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          _postBloc.close();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThirdScreen(
                                id: widget.userModel.id!,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  state.albumModelList[index].title!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
