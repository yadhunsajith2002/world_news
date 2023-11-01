import 'package:flutter/material.dart';

import 'package:world_news/constants/constants.dart';

import 'package:world_news/screens/home_screen/widgets/carousel/carousel_builder.dart';

import 'package:world_news/screens/home_screen/widgets/indicator/customTab_indicator.dart';

import 'package:world_news/screens/home_screen/widgets/tabBars/customtabBars.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteclr,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              flexibleSpace: Padding(
                  padding: const EdgeInsets.all(10.0), child: CarouselCustom()),
              toolbarHeight: 200,
              backgroundColor: whiteclr,
              elevation: 0,
              floating: false,
              snap: false,
              pinned: false,
            ),
            SliverAppBar(
              toolbarHeight: 5,
              backgroundColor: whiteclr,
              elevation: 0,
              floating: true,
              snap: true,
              pinned: true,
              bottom: TabBar(
                indicator: CustomTabIndicator(),
                isScrollable: true,
                indicatorWeight: 5,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelColor: primaryClr,
                unselectedLabelColor: Colors.grey.shade500,
                tabs: const [
                  Tab(text: 'Trending'),
                  Tab(text: 'Health'),
                  Tab(text: 'Sports'),
                  Tab(text: 'Politics'),
                  Tab(text: 'Business'),
                ],
              ),
            )
          ],
          body: TabBarView(
            children: [
              CustomTabBarView(category: "trending"),
              CustomTabBarView(category: "health"),
              CustomTabBarView(category: "sports"),
              CustomTabBarView(category: "politics"),
              CustomTabBarView(category: "business"),
            ],
          ),
        ),
      ),
    );
  }
}
