import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/screens/sixth_screen/bloc/photo_event.dart';
import 'package:technical_task/screens/sixth_screen/bloc/photo_state.dart';

import 'bloc/photo_bloc.dart';

class SixthScreen extends StatefulWidget {
  final int id;

  const SixthScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  late PhotoBloc _photoBloc;

  @override
  void initState() {
    _photoBloc=PhotoBloc();
    _photoBloc.add(GetPhotoEvent(widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<PhotoBloc, PhotoState>(
        bloc: _photoBloc,
        listener: (context, state) {
          if (state is PhotoErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.message!),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PhotoFetchedState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 24,

              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.cyanAccent,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.network(state.photoModelList[index].url!),
                    Text(state.photoModelList[index].title!),
                  ],),
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
