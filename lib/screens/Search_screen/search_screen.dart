import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:world_news/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:world_news/controller/news_api_controller.dart';

import 'package:world_news/screens/Search_screen/widgets/search_news_widget.dart';
import 'package:world_news/screens/home_screen/widgets/tabBars/customtabBars.dart';
import 'package:world_news/screens/home_screen/widgets/tabBars/widget/custom_Container.dart';
import 'package:world_news/widgets/shimmer/shimme_loading.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController searchcontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var providerWatch = context.watch<NewApiService>();

//     var providerRead = context.read<NewApiService>();
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: whiteclr,
//       ),
//       body: NestedScrollView(
//         headerSliverBuilder: (context, innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               backgroundColor: whiteclr,
//               toolbarHeight: 180,
//               // expandedHeight: 200,
//               flexibleSpace: Container(
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Search News',
//                         style: TextStyle(fontSize: 24),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         'News from all over the world',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: Center(
//                                 child: TextFormField(
//                               autocorrect: true,
//                               cursorColor: Colors.grey,
//                               onFieldSubmitted: (value) {
//                                 providerRead.searchNews(
//                                     searchQuery: searchcontroller.text);
//                               },
//                               controller: searchcontroller,
//                               decoration: InputDecoration(
//                                 suffixIcon: Icon(Icons.search),
//                                 hintText: "Search for news",
//                                 border: InputBorder.none,
//                               ),
//                             )),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ];
//         },
//         body: searchcontroller.text.isNotEmpty
//             ? FutureBuilder(
//                 future: context
//                     .read<NewApiService>()
//                     .searchNews(searchQuery: searchcontroller.text),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return ListView.builder(
//                       itemBuilder: (context, index) {
//                         return ShimmerLoading();
//                       },
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text('Error: ${snapshot.error}'),
//                     );
//                   } else {
//                     final searchResults =
//                         context.watch<NewApiService>().apidata.articles;

//                     if (searchResults != null && searchResults.isNotEmpty) {
//                       return ListView.separated(
//                         separatorBuilder: (context, index) {
//                           return SizedBox(
//                             height: 15,
//                           );
//                         },
//                         itemCount: searchResults.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CustomContainer(index: index),
//                           );
//                         },
//                       );
//                     } else {
//                       return Center(
//                         child: Text('cannot fetch data'),
//                       );
//                     }
//                   }
//                 },
//               )
//             : Center(
//                 child: Text(
//                   "Search for news",
//                   style: TextStyle(color: primaryClr),
//                 ),
//               ),
//       ),
//     );
//   }
// }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<NewApiService>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteclr,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: whiteclr,
              toolbarHeight: 180,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Search News',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'News from all over the world',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Center(
                              child: TextFormField(
                                autocorrect: true,
                                cursorColor: Colors.grey,
                                onFieldSubmitted: (value) {
                                  providerRead.onSubmit(
                                      searchquery: searchController.text);
                                  setState(() {});
                                },
                                controller: searchController,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      providerRead.onSubmit(
                                          searchquery: searchController.text);
                                      setState(() {});
                                    },
                                    child: Icon(Icons.search),
                                  ),
                                  hintText: "Search for news",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: searchController.text.isNotEmpty
            ? CustomTabBarView(
                future:
                    providerRead.searchNews(searchQuery: searchController.text),
                category: searchController.text,
              )
            : Center(
                child: Lottie.asset(
                    "assets/json/Animation - 1698747429471.json",
                    height: 150,
                    width: 180)),
      ),
    );
  }
}
