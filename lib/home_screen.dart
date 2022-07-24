import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapipatel/repository/user_repo.dart';

import 'models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          FutureBuilder(
            future: UserRepo.userData(),
            builder:
                (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: 200,
                  color: Colors.green,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lime.withOpacity(0.90),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.black,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              '${snapshot.data!.data![index].avatar}',
                                            ),
                                            fit: BoxFit.fill)),
                                    margin: EdgeInsets.all(10),
                                    width: 130,
                                    height: 130,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Id: ${snapshot.data!.data![index].id}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'FN: ${snapshot.data!.data![index].firstName}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'LN: ${snapshot.data!.data![index].lastName}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${snapshot.data!.data![index].email}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
