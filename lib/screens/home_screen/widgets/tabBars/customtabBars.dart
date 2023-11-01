import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/constants/constants.dart';
import 'package:world_news/controller/news_api_controller.dart';

import 'package:world_news/screens/description_screen/description_screen.dart';
import 'package:world_news/widgets/shimmer/shimme_loading.dart';
import 'package:world_news/screens/home_screen/widgets/tabBars/widget/custom_Container.dart';

class CustomTabBarView extends StatelessWidget {
  CustomTabBarView({Key? key, required this.category, this.future})
      : super(key: key);

  final String category;

  final Future<void>? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          future ?? context.read<NewApiService>().getdata(category: category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ShimmerLoading();
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          var getdata = context.watch<NewApiService>().apidata.articles;
          if (getdata != null && getdata.isNotEmpty) {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: getdata.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ArticleScreen(index: index),
                          ));
                        },
                        child: CustomContainer(index: index)));
              },
            );
          } else {
            return Center(
              child: Text(
                'Cannot Fetch Data',
                style: TextStyle(color: greyclr, fontSize: 20),
              ),
            );
          }
        }
      },
    );
  }
}
