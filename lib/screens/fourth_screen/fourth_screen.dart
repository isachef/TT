import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/screens/fiveth_screen/fiveth_screen.dart';
import 'package:technical_task/screens/second_screen/blo%D1%81/post_bloc.dart';

class FourthScreen extends StatefulWidget {
  final int id;

  const FourthScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  late PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = PostBloc();
    _postBloc.add(GetPosts(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('USER\'S POSTS'),
        centerTitle: true,
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: _postBloc,
        listener: (context, state) {
          if (state is PostErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error.message!),
            ));
          }
        },
        builder: (context, state) {
          if (state is PostFetchedState) {
            return ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: state.postModelList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    _postBloc.close();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FivethScreen(

                          postModel: state.postModelList[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
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
    );
  }
}
