import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/models/post_model.dart';
import 'package:technical_task/screens/fiveth_screen/bloc/comments_bloc.dart';

class FivethScreen extends StatefulWidget {
  final PostModel postModel;

  const FivethScreen({Key? key, required this.postModel}) : super(key: key);

  @override
  State<FivethScreen> createState() => _FivethScreenState();
}

class _FivethScreenState extends State<FivethScreen> {
  late CommentsBloc _commentsBloc;

  @override
  void initState() {
    _commentsBloc = CommentsBloc();
    _commentsBloc.add(GetCommentsEvent(widget.postModel.id!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.amberAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          widget.postModel.title!,
                          style: TextStyle(
                              color: Colors.amberAccent, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.postModel.body!.replaceAll('\\', '\n'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                BlocConsumer<CommentsBloc, CommentsState>(
                  bloc: _commentsBloc,
                  listener: (context, state) {
                    if (state is CommentsErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.error.message!),
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is CommentsFetchedState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.commentsModelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Name : ${state.commentsModelList[index].name}'),
                              Text(
                                  'Email : ${state.commentsModelList[index].email}'),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          state.commentsModelList[index].body!))
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 15,
                            child: Divider(
                              thickness: 3,
                              color: Colors.amberAccent,
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          TextEditingController controllerName =
                              TextEditingController();
                          TextEditingController controllerEmail =
                              TextEditingController();
                          TextEditingController controllerBody =
                              TextEditingController();

                          return Container(
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: 'enter your name'),
                                  controller: controllerName,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: 'enter your email'),
                                  controller: controllerEmail,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: 'enter your text'),
                                  controller: controllerBody,
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context, [
                                        controllerName,
                                        controllerEmail,
                                        controllerBody,
                                      ]);
                                    },
                                    child: Text('add comment'))
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text("Add comment"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
