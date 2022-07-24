import 'package:flutter/material.dart';
import 'package:holycode_fe/module/user_profile.dart';

class UserCard extends StatelessWidget {
  final UserProfile userProfile;
  const UserCard({required this.userProfile, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: 200, minHeight: 200),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.transparent,
                        child: userProfile.profileUrl != null &&
                                userProfile.profileUrl!.isNotEmpty
                            ? ClipOval(
                                child: Image.network(userProfile.profileUrl!))
                            : Text(
                                'M',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userProfile.username != null
                              ? userProfile.username!
                              : "",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Post count: ${userProfile.postCount != null ? userProfile.postCount! : ""}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Followers: ${userProfile.followers != null ? userProfile.followers! : ""}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Following: ${userProfile.following != null ? userProfile.following! : ""}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            userProfile.listOfImages != null &&
                    userProfile.listOfImages!.length > 1
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      shrinkWrap: true,
                      children: userProfile.listOfImages!.map((e) {
                        return e.isNotEmpty
                            ? ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: 200, minHeight: 200),
                                child: Image.network(e))
                            : Container();
                      }).toList(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          userProfile.postCount != null &&
                                  int.parse(userProfile.postCount!) > 0
                              ? 'User is private'
                              : 'User doesn\'t have pictures',
                          style: Theme.of(context).textTheme.headline4,
                        )),
                  )
          ],
        ),
      ),
    );
  }
}
