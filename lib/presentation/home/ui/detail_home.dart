import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logique/presentation/home/bloc/home_bloc.dart';
import 'package:logique/utils/state/view_data_state.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueAccent,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final status = state.detailUser.status;
                      if (status.isHasData) {
                        final data = state.detailUser.data;
                        return FadeInImage(
                            image: NetworkImage(data?.picture ?? ""),
                            placeholder: AssetImage(""),
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.cover,
                            alignment: Alignment.center,
                            fadeInDuration: const Duration(milliseconds: 100),
                            imageErrorBuilder: (context, error, stackTrace) {
                              if (error is Exception) {
                                return const SizedBox();
                              }
                              return const SizedBox();
                            });
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final data = state.detailUser.data;
                      return Text(
                          "${data?.title}. ${data?.firstName} ${data?.lastName}");
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_circle_outline,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final data = state.detailUser.data;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Gender: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data?.gender ?? ""),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Date of birth: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data?.dateOfBirth ?? ""),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Join From: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data?.registerDate ?? ""),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Email: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data?.email ?? ""),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Address: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data?.location?.street ?? ""),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final status = state.listPost.status;
                  if (status.isHasData) {
                    final data = state.listPost.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics:
                        const NeverScrollableScrollPhysics(),
                        itemCount: data!.length,
                        itemBuilder: (ctx, index) {
                          final item = data[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            color: Colors.red,
                                            child: FadeInImage(
                                                image: NetworkImage(
                                                    item.owner?.picture ?? ""),
                                                placeholder: AssetImage(""),
                                                fit: BoxFit.cover,
                                                placeholderFit: BoxFit.cover,
                                                alignment: Alignment.center,
                                                fadeInDuration: const Duration(
                                                    milliseconds: 100),
                                                imageErrorBuilder: (context,
                                                    error, stackTrace) {
                                                  if (error is Exception) {
                                                    return const SizedBox();
                                                  }
                                                  return const SizedBox();
                                                })),
                                      ),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "${item.owner?.title}. ${item.owner?.firstName} ${item.owner?.lastName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(item.publishDate ?? "")
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Image.network(item.image ?? ""),
                                  SizedBox(height: 5,),
                                  SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                        const NeverScrollableScrollPhysics(),
                                        itemCount: item.tags!.length,
                                        itemBuilder: (ctx, index){
                                        final tagged = item.tags![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.blue
                                            ),
                                            child: Center(child: Text(tagged)),
                                          ),
                                        );
                                    }),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(item.text ?? ""),
                                  Text("${item.likes.toString()} Likes", style: TextStyle(color: Colors.red),),

                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
