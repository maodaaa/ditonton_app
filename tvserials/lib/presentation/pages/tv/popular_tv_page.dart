import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvserials/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import 'package:tvserials/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';

class PopularTvPage extends StatefulWidget {
  const PopularTvPage({super.key});

  @override
  createState() => _PopularTvPageState();
}

class _PopularTvPageState extends State<PopularTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<PopularTvBloc>(context, listen: false)
            .add(OnPopularTvCalled()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvBloc, PopularTvState>(
          builder: (context, state) {
            if (state is PopularTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSerial = state.result[index];
                  return TvCard(tvSerial);
                },
                itemCount: state.result.length,
              );
            } else if (state is PopularTvError) {
              return Center(
                  key: const Key('error_message'), child: Text(state.message));
            } else {
              return const Center(
                child: Text("failed to load"),
              );
            }
          },
        ),
      ),
    );
  }
}
