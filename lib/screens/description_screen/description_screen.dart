import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/constants/constants.dart';
import 'package:world_news/controller/news_api_controller.dart';
import 'package:world_news/screens/home_screen/home_screen.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    Widget sizedBox = SizedBox(
      height: 15,
    );
    var providerwatch = context.watch<NewApiService>();
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          flexibleSpace: Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(providerwatch
                        .apidata.articles![index].urlToImage
                        .toString())),
                color: Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          toolbarHeight: 350,
          backgroundColor: Colors.white,
          elevation: 0,
          floating: false,
          snap: false,
          pinned: false,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 1,
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    providerwatch.apidata.articles![index].title.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  sizedBox,
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(providerwatch
                          .apidata.articles![index].urlToImage
                          .toString()),
                    ),
                    title: Text(providerwatch.apidata.articles![index].author
                        .toString()),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(providerwatch
                          .apidata.articles![index].source!.name
                          .toString()),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: primaryClr,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark,
                              color: primaryClr,
                            )),
                      ],
                    ),
                  ),
                  sizedBox,
                  Divider(
                    thickness: 2,
                  ),
                  sizedBox,
                  Text(
                    providerwatch.apidata.articles![index].content.toString(),
                    style: TextStyle(fontSize: 16, height: 1.8),
                    textAlign: TextAlign.justify,
                  ),
                  Divider(),
                  Text(
                    providerwatch.apidata.articles![index].description
                        .toString(),
                    style: TextStyle(fontSize: 16, height: 1.8),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    ));
  }
}
