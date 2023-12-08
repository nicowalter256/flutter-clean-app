import 'package:clean_app/features/events/presentation/bloc/event/remote/remote_event_bloc.dart';
import 'package:clean_app/features/events/presentation/bloc/event/remote/remote_event_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteEventsBloc, RemoteEventsState>(
      builder: (_, state) {
        if (state is RemoteEventsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteEventsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteEventsDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              var data = state.events![index];
              return Text(data.title);
              // return ArticleWidget(
              //   article: state.articles![index],
              //   onArticlePressed: (article) =>
              //       _onArticlePressed(context, article),
              // );
            },
            itemCount: state.events!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
