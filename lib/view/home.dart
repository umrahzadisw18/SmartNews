import 'package:flutter/material.dart';
import 'package:news_app/controller/fetchnews.dart';
import 'package:news_app/model/newsart.dart';
import 'package:news_app/view/widgets/news_container.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
   late NewsArt newsArt;
   bool isLoading =true;
   getNews()async{
    newsArt= await FetchNews.fetchNews();
    setState(() {
      isLoading=false;
    });
}
  @override
  void initState() {
    getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: 0),
  onPageChanged: (value) {
 setState(() {
   isLoading=true;
 });
    getNews();
  },
        itemBuilder:( context,index){
          return isLoading ? Center(
            child: CircularProgressIndicator(),
          ): NewsContainer(
            imgurl: newsArt.imgurl, 
            newshead: newsArt.newshead,
            newscnt: newsArt.newscnt,
            newsurl: newsArt.newsurl, 
            newsdescription:newsArt.newsdescription,
          );
        }
    )
    );
  }
}
