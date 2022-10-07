import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/screens/sixth_screen/sixth_screen.dart';
import 'package:technical_task/screens/third_screen/bloc/album_bloc.dart';

class ThirdScreen extends StatefulWidget {
  final int id;

  const ThirdScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late AlbumBloc _albumBloc;

  @override
  void initState() {
    _albumBloc = AlbumBloc();
    _albumBloc.add(GetAlbums(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('USER\'S ALBUMS'),
        centerTitle: true,
      ),
      body: BlocConsumer<AlbumBloc, AlbumState>(
        bloc: _albumBloc,
        listener: (context, state) {
          if (state is AlbumErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error.message!),
            ));
          }
        },
        builder: (context, state) {
          if (state is AlbumFetchedState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.albumModelList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SixthScreen(id: state.albumModelList[index].id!),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                    color: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            state.albumModelList[index].title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container(
            color: Colors.brown,
          );
        },
      ),
    );
  }
}
