import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 50,),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: FadeInImage(
                    image: AssetImage(""),
                    placeholder:
                    AssetImage(""),
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                    alignment: Alignment.center,
                    fadeInDuration: const Duration(milliseconds: 100),
                    imageErrorBuilder: (context, error, stackTrace) {
                      if (error is Exception) {
                        return const SizedBox();
                      }
                      return const SizedBox();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
