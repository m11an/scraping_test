import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../bloc/search/search_bloc.dart';
import '../../ui/search/widget/user_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext? ctx;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insta Scraper'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  labelText: kIsWeb
                      ? 'Enter username and press enter...'
                      : 'Enter username...',
                ),
                onChanged: (text) {},
                onSubmitted: (text) {
                  if (ctx != null) {
                    BlocProvider.of<SearchBloc>(ctx!).add(GetUserInfo(text));
                  }
                },
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => SearchBloc(),
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (blocCtx, state) {
                    ctx = blocCtx;
                    if (state is SearchInitial) {
                      return Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Search for users...',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      );
                    } else if (state is SearchLoaded) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        ),
                      );
                    } else if (state is Loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is UserInfoLoaded) {
                      if (state.errorMsg == null || state.errorMsg!.isEmpty) {
                        if (state.userProfile != null) {
                          return UserCard(userProfile: state.userProfile!);
                        } else {
                          return Center(
                            child: Text(
                              'User doesn\'t exists.',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }
                      } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.errorMsg!,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        );
                      }
                    }
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
